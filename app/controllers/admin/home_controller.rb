module Admin
  class HomeController < AdminController
    def index
      @unreviewed_blog_article_count = BlogArticle.unreviewed.count
      @unreviewed_period_application_count = current_user.managed_period_applications.unreviewed.count
      @unreviewed_topic_exam_count = current_user.assigned_topic_exams.unreviewed.count

      if current_user.super_admin?
        @unassigned_topic_exam_count = TopicExam.unassigned.count
      end
    end
  end
end
