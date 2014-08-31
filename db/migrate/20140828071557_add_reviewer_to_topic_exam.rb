class AddReviewerToTopicExam < ActiveRecord::Migration
  def change
    add_reference :topic_exams, :reviewer, index: true
  end
end
