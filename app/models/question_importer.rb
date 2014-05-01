require 'csv'

class QuestionImporter

  def initialize(unit, file)
    @unit = unit
    @table = CSV.read file, :encoding => 'UTF-8'
  rescue ArgumentError
    @table = CSV.read file, :encoding => 'GBK'
  ensure
    @rows = @table[1..-1].map{|row_data| Row.new row_data, self }
  end

  def table_head
    @table_head ||= @table[0].compact
  end

  def result
    msg = "导入完成"
    msg << "，其中有#{duplicate_rows.count}个重复的试题未被导入。" if duplicate_rows.any?
    msg
  end

  def duplicate_rows
    @rows.select{|row| row.duplicate? }
  end

  def question_type_position
    table_head.index '大题目'
  end

  def question_position
    table_head.index '小题目'
  end

  def choice_indexes
    return @choice_indexes if defined? @choice_indexes
    Rails.logger.debug table_head
    choices = table_head.select{|data| data.downcase =~ /[a-z]/ }
    @choice_indexes = choices.inject({}){|result, choice| result.merge choice.downcase => table_head.index(choice) }
  end

  def correct_choice_position
    table_head.index '正确答案'
  end

  def import_multiple_choice_questions(content)
    @unit.multiple_choice_questions.create :content => content
  end

  def import_singular_choice_questions(content)
    @unit.singular_choice_questions.create :content => content
  end

  class Row
    def initialize(data, importer)
      @data = data
      @importer = importer
      if singular_choice?
        @question = @importer.import_singular_choice_questions question
      else
        @question = @importer.import_multiple_choice_questions question
      end
      add_choices
    end

    def question_type
      @data[@importer.question_type_position]
    end

    def singular_choice?
      !!(question_type =~ /单选/)
    end

    def multiple_choice?
      !!(question_type =~ /多选/)
    end

    def question
      @data[@importer.question_position].strip
    end

    def add_choices
      if !duplicate?
        @importer.choice_indexes.map do |k, i|
          @question.choices.create :content => @data[i].strip,
            :correct => correct_choice.include?(k)
        end
      end
    end

    def correct_choice
      @data[@importer.correct_choice_position].downcase
    end

    def duplicate?
      @question.invalid?
    end

  end
end
