class SessionsController < ApplicationController
  def create
    if @account = Account.authenticate(params[:username], params[:password])
      sign_in @account
      redirect_to admin_url
    else
      render :new
    end
  end
end
