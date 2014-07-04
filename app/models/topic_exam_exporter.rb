class TopicExamExporter
  include CSVExporter 
  def initialize(topic_exams)
    @collection = topic_exams
    @columns = {
      :student_username => '用户名',
      :student_name => '姓名',
      :name => '专题',
      :score => '成绩',
      :passed_at => '结业日期'
    }
  end
end
