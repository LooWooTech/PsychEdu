class ChangeCourseToChapter < ActiveRecord::Migration
  def change
    rename_table :courses, :chapters
    rename_table :course_learnings, :chapter_learnings
    rename_column :chapter_learnings, :course_id, :chapter_id
    rename_column :unit_learnings, :course_learning_id, :chapter_learning_id
    rename_column :units, :course_id, :chapter_id
  end
end
