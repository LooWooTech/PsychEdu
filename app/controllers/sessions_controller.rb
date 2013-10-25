class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_name params[:name]
    signin @user
    redirect_to root_path
  end
end
