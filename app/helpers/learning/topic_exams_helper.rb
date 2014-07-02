module Learning
  module TopicExamsHelper
    def exam_state(exam)
      return '通过' if exam.passed?
      return '未通过' if exam.unpassed?
      '未审核'
    end
  end
end
