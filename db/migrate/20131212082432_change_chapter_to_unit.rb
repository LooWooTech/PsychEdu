class ChangeChapterToUnit < ActiveRecord::Migration
  def change
    remove_index :chapters, :column => :course_id
    remove_index :videos, :column => :chapter_id

    rename_table :chapters, :units
    rename_column :videos, :chapter_id, :unit_id

    add_index :units, :course_id
    add_index :videos, :unit_id

  end
end
