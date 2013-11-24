class UsersController < ApplicationController

  def new
    @user = Student.new
  end

  def create
    @user = Student.new params[:user]
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end
end
