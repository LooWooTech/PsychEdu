class ChangeChapterToUnit < ActiveRecord::Migration
  def change
    rename_table :chapters, :units
    rename_column :videos, :chapter_id, :unit_id
  end
end
