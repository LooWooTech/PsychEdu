class RemoveIntroductionFromChapters < ActiveRecord::Migration
  def up
    change_table :chapters do |t|
      t.remove :introduction
    end
  end
  def down
    change_table :chapters do |t|
      t.text :introduction
    end
  end
end
