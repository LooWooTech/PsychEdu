module Admin
  class ForumCatalogsController < AdminController
    def new
      @forum_catalog = ForumCatalog.new
    end

    def create
      @forum_catalog = ForumCatalog.new catalog_params
      if @forum_catalog.save
        flash[:notice] = "创建了社区版块分类#{@forum_catalog.name}"
        redirect_to forum_catalogs_path
      else
        render :new
      end
    end

    def index
      @forum_catalogs = ForumCatalog.all
    end

    private

    def catalog_params
      params.require(:forum_catalog).permit(:name)
    end
  end
end
