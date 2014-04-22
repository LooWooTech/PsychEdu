class AddPassedAtToTopicExams < ActiveRecord::Migration
  def change
    add_column :topic_exams, :passed_at, :datetime
  end
end
