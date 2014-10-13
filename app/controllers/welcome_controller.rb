class WelcomeController < ApplicationController
  def index
    @news = News.last(10)
    @course_arrangements = CourseArrangement.last(10)
    @course_introductions = CourseIntroduction.last(10)
    @topic_introductions = TopicIntroduction.last(10)
    @case_sharings = CaseSharing.last(10)
    @faqs = FAQ.last(10)
    @trial_videos = TrialVideo.last(10)
    @blog_articles = BlogArticle.published.last(10)
  end
end
