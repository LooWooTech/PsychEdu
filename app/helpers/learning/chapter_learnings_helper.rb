module Learning
  module ChapterLearningsHelper
    def unit_exam_link(unit_learning)
      if unit_learning.ready_for_exam?
        if unit_learning.unfinished_exam
          link_to '继续上次练习', unit_exam_path(unit_learning.unfinished_exam), :class => 'btn btn-sm btn-primary'
        else
          if unit_learning.exam_limited?
            raw "<span class='btn btn-sm btn-primary'>开始练习</span>"
          else
            link_to '开始练习', unit_learning_unit_exams_path(unit_learning), :method => :post, :class => "btn btn-sm btn-primary"
          end
        end
      end
    end

    def unit_name(unit_learning)
      unit_learning.only_child? ? unit_learning.chapter_name : unit_learning.name
    end

    def mode_switch_link(video_watching)
      text = video_watching.with_comment? ? '非点评版' : '点评版'
      link_to text, video_watching_path(video_watching, :with_comment => !video_watching.with_comment?)
    end
  end
end
