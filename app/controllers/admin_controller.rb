class AdminController < ApplicationController
  before_action :admin_required

  def admin_required
    sign_in_first('请以管理员身份登录') if !signed_in? || !current_user.is_a?(Administrator)
  end
end
