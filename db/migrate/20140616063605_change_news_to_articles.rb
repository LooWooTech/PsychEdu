class ChangeNewsToArticles < ActiveRecord::Migration
  def change
    rename_table :news, :articles
    add_column :articles, :type, :string
  end
end
