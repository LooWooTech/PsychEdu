class RemoveMinutesFromChapterLearnings < ActiveRecord::Migration
  def up
    change_table :chapter_learnings do |t|
      t.remove :minutes
    end
  end

  def down
    change_table :chapter_learnings do |t|
      t.integer :minutes, :default => 0
    end
  end
end
