class ChangeBlogArticleWriterToAuthor < ActiveRecord::Migration
  def change
    rename_column :blog_articles, :writer_id, :author_id
  end
end
