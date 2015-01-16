class ChangeBlogArticleWriterToAuthor < ActiveRecord::Migration
  def change
    remove_index :blog_articles, :column => :writer_id
    rename_column :blog_articles, :writer_id, :author_id
    add_index :blog_articles, :author_id
  end
end
