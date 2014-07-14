module Learning
  module BlogArticlesHelper
    def publish_link(blog, options)
      if blog.publishing_unrequested?
        link_to '申请发表', request_publishing_learning_blog_article_path(blog), options
      else
        link_to '撤消发表', unpublish_learning_blog_article_path(blog), options
      end
    end
  end
end
