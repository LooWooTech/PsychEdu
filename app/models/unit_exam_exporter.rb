class UnitExamExporter
  include CSVExporter

  def initialize(unit_exams)
    @collection = unit_exams
    @columns = {
      :student_username => '用户名',
      :student_name => '姓名',
      :topic_name => '专题',
      :chapter_name => '章节',
      :name => '单元',
      :used_minutes=> '用时（分钟）',
      :score => '得分',
      :created_at => '考试时间'
    }
  end

end
