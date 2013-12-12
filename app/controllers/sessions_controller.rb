class SessionsController < ApplicationController
  def create
    if @account = Account.authenticate(params[:username], params[:password])
      sign_in @account
      redirect_back_or_default root_path
    else
      render :new
    end
  end
end
