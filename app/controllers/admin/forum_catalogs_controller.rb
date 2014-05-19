module Admin
  class ForumCatalogsController < AdminController

    before_action :find_forum_catalog, :only => [:edit, :update, :destroy]
    def new
      @forum_catalog = ForumCatalog.new
    end

    def create
      @forum_catalog = ForumCatalog.new catalog_params
      if @forum_catalog.save
        flash[:notice] = "创建了社区版块分类 #{@forum_catalog.name}"
        redirect_to forum_catalogs_path
      else
        render :new
      end
    end

    def index
      @forum_catalogs = ForumCatalog.all
    end

    def edit
      render :new
    end

    def update
      if @forum_catalog.update_attributes catalog_params
        flash[:notice] = "修改了社区版块分类 #{@forum_catalog.name}"
        redirect_to forum_catalogs_path
      else
        render :new
      end
    end

    private

    def find_forum_catalog
      @forum_catalog = ForumCatalog.find params[:id]
    end

    def catalog_params
      params.require(:forum_catalog).permit(:name)
    end
  end
end
