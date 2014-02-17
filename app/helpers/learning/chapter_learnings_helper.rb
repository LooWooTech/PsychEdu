module Learning
  module ChapterLearningsHelper
    def unit_exam_link(unit_learning)
      if unit_learning.ready_for_exam?
        if unit_learning.unfinished_exam
          link_to '继续上次练习', unit_exam_path(unit_learning.unfinished_exam), :class => 'start-exam'
        else
          link_to '开始练习', unit_learning_unit_exams_path(unit_learning), :method => :post, :class => 'start-exam'
        end
      end
    end

    def unit_name(unit_learning)
      unit_learning.only_child? ? unit_learning.chapter_name : unit_learning.name
    end
  end
end
