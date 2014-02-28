require 'csv'

class QuestionImporter

  attr_reader :unit

  def initialize(unit, file)
    @unit = unit
    @table = CSV.read file, :encoding => 'UTF-8'
  rescue ArgumentError
    @table = CSV.read file, :encoding => 'GBK'
  ensure
    @rows = @table[1..-1].map{|row_data| Row.new row_data, self }
  end

  def table_head
    @table[0]
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
      if singular_choice?
        @question = unit.singular_choice_questions.create :content => question
      else
        @question = unit.multiple_choice_questions.create :content => question
      end
      add_choices
    end

    def unit
      @table.unit
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
      @raw_data[@table.question_position].strip
    end

    def add_choices
      if !duplicate?
        @table.choice_indexes.map do |k, i|
          @question.choices.create :content => @raw_data[i].strip,
            :correct => correct_choice.include?(k)
        end
      end
    end

    def correct_choice
      @raw_data[@table.correct_choice_position].downcase
    end

    def duplicate?
      @question.invalid?
    end

  end
end
