class ChangeCourseToChapter < ActiveRecord::Migration
  def change
    remove_index :courses, :column => :topic_id
    remove_index :course_learnings, :column => :course_id
    remove_index :course_learnings, :column => :topic_learning_id
    remove_index :unit_learnings, :column => :course_learning_id
    remove_index :units, :column => :course_id

    rename_table :courses, :chapters
    rename_table :course_learnings, :chapter_learnings
    rename_column :chapter_learnings, :course_id, :chapter_id
    rename_column :unit_learnings, :course_learning_id, :chapter_learning_id
    rename_column :units, :course_id, :chapter_id

    add_index :chapters, :topic_id
    add_index :chapter_learnings, :chapter_id
    add_index :chapter_learnings, :topic_learning_id
    add_index :unit_learnings, :chapter_learning_id
    add_index :units, :chapter_id
  end
end
