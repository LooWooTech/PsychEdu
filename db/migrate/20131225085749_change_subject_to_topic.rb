class ChangeSubjectToTopic < ActiveRecord::Migration
  def change
    rename_table :subjects, :topics
    rename_column :subject_learnings, :subject_id, :topic_id
    rename_column :courses, :subject_id, :topic_id
    rename_table :subject_learnings, :topic_learnings
    rename_column :course_learnings, :subject_learning_id, :topic_learning_id
    rename_column :learning_periods, :subject_learning_id, :topic_learning_id
  end
end
