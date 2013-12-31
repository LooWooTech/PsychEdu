class ExamAnswer < ActiveRecord::Base
  belongs_to :exam_question
end
