module Admin
  class AdministratorsController < AdminController

    before_action :find_administrator, :only => [:edit, :update, :destroy]

    def index
      @search = Administrator.search params[:q]
      @administrators = @search.result.page(params[:page]).per(10)
    end

    def new
      @administrator = Administrator.new
    end

    def create
      @administrator = Administrator.new admin_params
      if @administrator.save
        flash[:notice] = "您创建了管理员 #{@administrator.username}"
        redirect_to admin_administrators_path
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @administrator.update_attributes admin_params
        flash[:notice] = "您更新了管理员 #{@administrator.username} 的资料"
        redirect_to admin_administrators_path
      else
        render :new
      end
    end

    def destroy
      @administrator.destroy
      flash[:notice] = "您删除了用户 #{@administrator.username}"
      redirect_to admin_administrators_path
    end

    private

    def find_administrator
      @administrator = Administrator.find params[:id]
    end

    def admin_params
      params[:administrator][:roles].delete '0'
      params.require(:administrator).permit(:roles => [], :account_attributes => [:username, :password, :password_confirmation])
    end
  end
end
