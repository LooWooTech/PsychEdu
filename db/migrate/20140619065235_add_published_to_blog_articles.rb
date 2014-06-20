class AddPublishedToBlogArticles < ActiveRecord::Migration
  def change
    add_column :blog_articles, :published, :boolean, :default => false
  end
end
