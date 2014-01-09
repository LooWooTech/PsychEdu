module Learnings
  module ChapterLearningsHelper
    def unit_exam_link(unit_learning)
      if unit_learning.ready_for_exam?
        if unit_learning.unfinished_exam
          "<li>#{link_to '继续测试', unit_exam_path(unit_learning.unfinished_exam)}</li>"
        else
          "<li>#{link_to '开始测试', unit_learning_unit_exams_path(unit_learning), :method => :post}</li>"
        end
      end
    end

    def unit_learning_hours(unit_learning)
      (unit_learning.seconds / 60 / 60).round(1)
    end

    def unit_exam_state(unit_learning)
      unit_learning.passed? ? '通过考试' : '未通过考试'
    end
  end
end
