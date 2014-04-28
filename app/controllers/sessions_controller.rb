class SessionsController < ApplicationController
  def create
    if @account = Account.authenticate(params[:username], params[:password])
      sign_in @account
      redirect_back_or_root
    else
      flash.now[:notice] = '用户名或密码不正确'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to sign_in_path
  end
end
