module Admin
  module BlogArticleHelper
    def admin_publish_link(article)
      if article.publishing_accepted?
        link_to '拒绝发表', reject_publishing_admin_blog_article_path(article), :method => :patch
      else
        link_to '同意发表', accept_publishing_admin_blog_article_path(article), :method => :patch
      end
    end
  end
end
