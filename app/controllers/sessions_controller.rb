class SessionsController < ApplicationController
  def create
    if @account = Account.authenticate(params[:login], params[:password])
      login @account
      redirect_to admin_url
    else
      render :new
    end
  end
end
