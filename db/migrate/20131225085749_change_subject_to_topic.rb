class ChangeSubjectToTopic < ActiveRecord::Migration
  def change
    remove_index :subject_learnings, :column => :subject_id
    remove_index :courses, :column => :subject_id
    remove_index :subject_learnings, :column => :student_id
    remove_index :course_learnings, :column => :subject_learning_id
    remove_index :learning_periods, :column => :subject_learning_id

    rename_table :subjects, :topics
    rename_column :subject_learnings, :subject_id, :topic_id
    rename_column :courses, :subject_id, :topic_id
    rename_table :subject_learnings, :topic_learnings
    rename_column :course_learnings, :subject_learning_id, :topic_learning_id
    rename_column :learning_periods, :subject_learning_id, :topic_learning_id

    add_index :topic_learnings, :topic_id
    add_index :topic_learnings, :student_id
    add_index :courses, :topic_id
    add_index :course_learnings, :topic_learning_id
    add_index :learning_periods, :topic_learning_id

  end
end
