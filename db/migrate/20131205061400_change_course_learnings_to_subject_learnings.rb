class ChangeCourseLearningsToSubjectLearnings < ActiveRecord::Migration
  def change
    rename_column :learning_periods, :course_learning_id, :subject_learning_id
    rename_column :course_learnings, :course_id, :subject_id
    rename_table :course_learnings, :subject_learnings
  end
end
