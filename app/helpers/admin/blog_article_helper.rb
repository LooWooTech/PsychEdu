module Admin
  module BlogArticleHelper
    def blog_publishing_state(blog)
      case blog.publish_state
      when BlogArticle::PUBLISH_STATE[:unreviewed]
        '未审核'
      when BlogArticle::PUBLISH_STATE[:accepted]
        '通过'
      when BlogArticle::PUBLISH_STATE[:rejected]
        '退回'
      end
    end
  end
end
