class LearningController < ApplicationController
  before_filter :admin_required

  def student_required
    sign_in_first('请以学员身份登录') if !signed_in? || !current_user.is_a?(Student)
  end
end
