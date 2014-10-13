class RemoveTopFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :top
  end

  def down
    add_column :articles, :top, :boolean, :default => false
  end
end
