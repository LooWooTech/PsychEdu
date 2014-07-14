class ChangeBlogArticlesPublishedToPublishState < ActiveRecord::Migration

  class BlogArticle < ActiveRecord::Base
    PUBLISH_STATE = {
      :unrequested => 0,
      :unreviewed => 1,
      :accepted => 2,
      :rejected => 3
    }
  end
  #add column and remove the old one

  def up
    add_column :blog_articles, :publish_state, :integer, :default => BlogArticle::PUBLISH_STATE[:unrequested]

    BlogArticle.find_each{|a| a.update_attribute :publish_state, BlogArticle::PUBLISH_STATE[:accepted] if a.published }
    remove_column :blog_articles, :published
  end

  def down
    add_column :blog_articles, :published, :boolean, :default => false
    BlogArticle.find_each{|a| a.update_attribute :published, true if a.publish_state == BlogArticle::PUBLISH_STATE[:accepted] }
    remove_column :blog_articles, :publish_state
  end
end
