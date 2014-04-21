class LearningController < ApplicationController
  layout 'learning'

  before_action :student_required
  before_action :ensure_topic_open
  before_action :ensure_topic_learning_is_ongoing

  helper_method :current_topic_learning, :chapter_learnings, :page_title

  private

  def student_required
    sign_in_first('请以学员身份登录') if !signed_in? || !current_user.is_a?(Student)
  end

  def ensure_topic_open
    render :text => '您好，您没有任何正在学习的专题，请在学习期间访问，或联系系统管理员。' if current_user.no_topic_open?
  end

  def ensure_topic_learning_is_ongoing
    redirect_to topic_learnings_path if !current_topic_learning.ongoing?
  end

  def current_topic_learning
    @current_topic_learning ||= current_user.current_topic_learning
  end

  def current_topic_learning=(topic_learning)
    @current_topic_learning = topic_learning
    current_user.change_current_topic_learning @current_topic_learning
  end

  def chapter_learnings
    @chapter_learnings ||= current_topic_learning.chapter_learnings
  end

  def page_title
    @page_title || '建德教育心理教学实操平台'
  end

end
