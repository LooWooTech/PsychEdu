class AdminController < ApplicationController
  before_filter :admin_required

  def admin_required
    sign_in_first('请以管理员身份登录') if !logged_in? || !current_user.is_a?(Administrator)
  end
end
