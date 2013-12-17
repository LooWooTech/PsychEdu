class LearningController < ApplicationController
  layout 'learning'

  before_filter :student_required
  before_filter :check_subject_opened

  helper_method :current_subject_learning, :course_learnings

  private

  def student_required
    sign_in_first('请以学员身份登录') if !signed_in? || !current_user.is_a?(Student)
  end

  def check_subject_opened
    render :text => '你好，您未开通任何专题，请联系系统管理员。' if current_user.no_subject_opened?
  end

  def current_subject_learning
    @current_subject_learning ||= current_user.current_subject_learning
  end

  def current_subject_learning=(subject_learning)
    @current_subject_learning = subject_learning
    current_user.change_current_subject_learning @current_subject_learning
  end

  def course_learnings
    @course_learnings ||= current_subject_learning.course_learnings.page(params[:page]).per(10)
  end
end
