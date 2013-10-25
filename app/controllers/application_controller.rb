class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    return @current_user if defined? @current_user
    @current_user ||= User.find session[:current_user_id]
  end

  def signin(user)
    session[:current_user_id] = user
  end
end
