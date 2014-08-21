module Admin
  class HomeController < AdminController
    def index
      @unreviewed_period_application_count = current_user.managed_period_applications.unreviewed.count
      @unreviewed_topic_exam_count = TopicExam.unreviewed.count
      @unreviewed_blog_article_count = BlogArticle.unreviewed.count
    end
  end
end
