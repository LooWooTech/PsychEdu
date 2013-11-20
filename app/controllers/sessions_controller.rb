class SessionsController < ApplicationController

  def create
    @user = Student.find_or_create_by(:name => params[:name])
    signin @user
    redirect_to root_path
  end
end
