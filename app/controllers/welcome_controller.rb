class WelcomeController < ApplicationController
  def index
    @news = News.last(5)
    @course_arrangements = CourseArrangement.last(5)
    @course_introductions = CourseIntroduction.last(5)
    @topic_introductions = TopicIntroduction.last(5)
    @case_sharings = CaseSharing.last(5)
    @faqs = FAQ.last(5)
  end
end
