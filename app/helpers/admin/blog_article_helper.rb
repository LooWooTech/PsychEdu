module Admin
  module BlogArticleHelper
    def publish_link(article)
      if !article.published?
        link_to '发布到学员风采', publish_admin_blog_article_path(article), :method => :patch
      else
        link_to '取消发布', un_publish_admin_blog_article_path(article), :method => :patch
      end
    end
  end
end
