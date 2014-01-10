class SessionsController < ApplicationController
  def create
    if @account = Account.authenticate(params[:username], params[:password])
      sign_in @account
      redirect_back_or_root
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path
  end
end
