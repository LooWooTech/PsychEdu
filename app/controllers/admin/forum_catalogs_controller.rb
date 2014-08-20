module Admin
  class ForumCatalogsController < AdminController

    before_action :find_forum_catalog_and_authorize, :only => [:edit, :update, :destroy]

    def new
      authorize :forum_catalog
      @forum_catalog = ForumCatalog.new
    end

    def create
      authorize :forum_catalog
      @forum_catalog = ForumCatalog.new catalog_params
      if @forum_catalog.save
        flash[:notice] = "您创建了 #{@forum_catalog.name}"
        redirect_to admin_forum_catalogs_path
      else
        render :new
      end
    end

    def index
      authorize :forum_catalog
      @forum_catalogs = ForumCatalog.all
    end

    def edit
      render :new
    end

    def update
      if @forum_catalog.update_attributes catalog_params
        flash[:notice] = "您修改了 #{@forum_catalog.name}"
        redirect_to admin_forum_catalogs_path
      else
        render :new
      end
    end

    def destroy
      @forum_catalog.destroy
      flash[:notice] = "您删除了 #{@forum_catalog.name}"
      redirect_to admin_forum_catalogs_path
    end

    private

    def find_forum_catalog_and_authorize
      @forum_catalog = ForumCatalog.find params[:id]
      authorize @forum_catalog
    end

    def catalog_params
      params.require(:forum_catalog).permit(:name)
    end
  end
end
