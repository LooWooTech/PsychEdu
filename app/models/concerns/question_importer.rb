require 'csv'

module QuestionImporter
  extend ActiveSupport::Concern

  included do
    before_save :generate_question_repository
  end

  def generate_question_repository
    if question_repository_uploaded?
      Table.new(question_repository_file.path, self).import
      self.remove_question_repository_file = true
    end
  end

  def question_repository_uploaded?
    question_repository_file.file.try :exists?
  end

  class Table
    def initialize(csv_path, unit)
      @unit = unit
      @table = CSV.read csv_path, :encoding => 'UTF-8'
    rescue ArgumentError
      @table = CSV.read csv_path, :encoding => 'GBK'
    end

    def table_head
      @table[0]
    end

    def import
      rows.each do |row|
        if row.singular_choice?
          question = @unit.singular_choice_questions.create :content => row.question
        else
          question = @unit.multiple_choice_questions.create :content => row.question
        end
        question.choices << row.choices
      end
    end

    def rows
      @rows ||= @table[1..-1].map{|raw_data| Row.new raw_data, self }
    end

    def question_type_position
      table_head.index '大题目'
    end

    def question_position
      table_head.index '小题目'
    end

    def choice_indexes
      return @choice_indexes if defined? @choice_indexes
      choices = table_head.select{|data| data.downcase =~ /[a-z]/ }
      @choice_indexes = choices.inject({}){|result, choice| result.merge choice.downcase => table_head.index(choice) }
    end

    def correct_choice_position
      table_head.index '正确答案'
    end

    class Row
      def initialize(raw_data, table)
        @raw_data = raw_data
        @table = table
      end

      def question_type
        @raw_data[@table.question_type_position]
      end

      def singular_choice?
        !!(question_type =~ /单选/)
      end

      def multiple_choice?
        !!(question_type =~ /多选/)
      end

      def question
        @raw_data[@table.question_position]
      end

      def choices
        @table.choice_indexes.map do |k, i|
          Choice.new :content => @raw_data[i], :correct => (k == correct_choice)
        end
      end

      def correct_choice
        @raw_data[@table.correct_choice_position].downcase
      end

    end
  end
end
