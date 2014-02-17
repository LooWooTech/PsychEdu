class LearningController < ApplicationController
  layout 'learning'

  before_action :student_required
  before_action :ensure_topic_open

  helper_method :current_topic_learning, :chapter_learnings, :page_title

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

  def chapter_learnings
    @chapter_learnings ||= current_topic_learning.chapter_learnings.page(params[:page]).per(10)
  end

  def page_title
    @page_title || '建德教育心理教学实操平台'
  end

end
