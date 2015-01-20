module Admin
  class KlassesController < AdminController

    before_action :find_klass_and_authorize, :only => [:edit, :update, :destroy]

    def new
      authorize :klass
      @klass = Klass.new
    end

    def create
      authorize :klass
      @klass = Klass.new klass_params
      if @klass.save
        flash[:notice] = "您新增了班级 #{@klass.name}"
        redirect_to admin_klasses_path
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @klass.update_attributes klass_params
        flash[:notice] = "您修改了班级 #{@klass.name}"
        redirect_to admin_klasses_path
      else
        render :new
      end
    end

    def index
      @klasses = Klass.all
    end

    def destroy
      @klass.destroy
      flash[:notice] = "您删除了班级 #{@klass.name}"
      redirect_to admin_klasses_path
    end

    private

    def klass_params
      params.require(:klass).permit(:name)
    end

    def find_klass_and_authorize
      @klass = Klass.find params[:id]
      authorize @klass
    end
  end
end
