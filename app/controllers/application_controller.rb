class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403", :format => [:html], :status => 403, :layout => false
  end

  def current_user
    return @current_user if defined? @current_user
    @current_user ||= Student.find session[:current_user_id]
  end

  def signin(user)
    session[:current_user_id] = user
  end

  def find_polymorphic_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
