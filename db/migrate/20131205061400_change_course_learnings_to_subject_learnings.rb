class ChangeCourseLearningsToSubjectLearnings < ActiveRecord::Migration
  def change
    remove_index :learning_periods, :column => :course_learning_id
    remove_index :course_learnings, :column => :course_id
    remove_index :course_learnings, :column => :student_id

    rename_column :learning_periods, :course_learning_id, :subject_learning_id
    rename_column :course_learnings, :course_id, :subject_id
    rename_table :course_learnings, :subject_learnings

    add_index :learning_periods, :subject_learning_id
    add_index :subject_learnings, :subject_id
    add_index :subject_learnings, :student_id
  end
end
