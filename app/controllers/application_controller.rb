class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
    render :file => "#{Rails.root}/public/403", :format => [:html], :status => 403, :layout => false
  end

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403", :format => [:html], :status => 403, :layout => false
  end

  helper_method :current_user

  def sign_in(account)
    session[:current_account_id] = account.id
    @current_user = account.owner
  end

  def sign_out
    session[:current_account_id] = session[:return_to] = nil
    @current_user = nil
  end

  def current_user
    return @current_user if defined? @current_user
    @current_user ||= Account.find_by(:id => session[:current_account_id]).try(:owner)
  end

  def signed_in?
    !!current_user
  end

  def student_required
    sign_in_first('请以学员身份登录') if !signed_in? || !current_user.is_a?(Student)
  end

  def user_required
    sign_in_first if !signed_in?
  end

  def sign_in_first(notice='请先登录')
    store_location
    flash[:notice] = notice
    redirect_to sign_in_path
    return false
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_root
    if current_user.is_a? Student
      root_path = learning_root_path
    else
      root_path = admin_root_path
    end
    redirect_to(session[:return_to]||root_path)
    session[:return_to] = nil
  end

  def find_polymorphic_parent
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def belongs_to_module?(name)
    self.class.belongs_to_module? name
  end

  class << self
    def belongs_to_module?(name)
      modules[name].try :include?, self
    end

    def belongs_to_module(name)
      modules[name] << self
    end

    def modules
      @modules ||= {
        :learning => [],
        :case => [],
        :material => [],
        :forum => [],
        :personal => [],
        :supervision => []
      }
    end
  end
end
