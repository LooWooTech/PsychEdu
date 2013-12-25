class LearningController < ApplicationController
  layout 'learning'

  before_filter :student_required
  before_filter :ensure_topic_open

  helper_method :current_topic_learning, :course_learnings

  private

  def student_required
    sign_in_first('请以学员身份登录') if !signed_in? || !current_user.is_a?(Student)
  end

  def ensure_topic_open
    render :text => '你好，您未开通任何专题，请联系系统管理员。' if current_user.no_topic_open?
  end

  def current_topic_learning
    @current_topic_learning ||= current_user.current_topic_learning
  end

  def current_topic_learning=(topic_learning)
    @current_topic_learning = topic_learning
    current_user.change_current_topic_learning @current_topic_learning
  end

  def course_learnings
    @course_learnings ||= current_topic_learning.course_learnings.page(params[:page]).per(10)
  end
end
