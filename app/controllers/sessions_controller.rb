class SessionsController < ApplicationController

  def create
    if Administrator.authenticate params[:login], params[:password]
      redirect_to admin_url
    else
      render :new
    end
  end
end
