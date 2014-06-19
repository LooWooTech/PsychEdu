class WelcomeController < ApplicationController
  def index
    @news = News.nontop.last(5)
    @course_arrangements = CourseArrangement.nontop.last(5)
    @course_introductions = CourseIntroduction.nontop.last(5)
    @topic_introductions = TopicIntroduction.nontop.last(5)
    @case_sharings = CaseSharing.nontop.last(5)
    @faqs = FAQ.nontop.last(5)
  end
end
