module Admin
  class TopicMaterialsController < AdminController

    before_action :find_topic_material, :only => [:edit, :update, :destroy]

    def index
      @search = TopicMaterial.search params[:q]
      @topic_materials = @search.result.page(params[:page]).per(10)
    end

    def new
      @topic_material = TopicMaterial.new
      @topic_material.videos.build
      @topic_material.attachments.build
    end

    def create
      @topic_material = current_user.topic_materials.build topic_material_params
      if @topic_material.save
        flash[:notice] = "您新增了资料：#{@topic_material.title}"
        redirect_to admin_topic_materials_path
      else
        @topic_material.videos.build if @topic_material.videos.empty?
        render :new
      end
    end

    def edit
      @topic_material.videos.build if @topic_material.videos.empty?
      @topic_material.attachments.build
      render :new
    end

    def update
      if @topic_material.update_attributes topic_material_params
        flash[:notice] = "更新了资料：#{@topic_material.title}"
        redirect_to admin_topic_materials_path
      else
        render :new
      end
    end

    def destroy
      @topic_material.destroy
      flash[:notice] = "删除了资料：#{@topic_material.title}"
      redirect_to admin_topic_materials_path
    end

    private

    def find_topic_material
      @topic_material = TopicMaterial.find params[:id]
    end

    def topic_material_params
      params.require(:topic_material).permit(:title, :content, :topic_id, :type,
        :videos_attributes => [:name, :url, :_destroy, :id],
        :attachments_attributes => [:file, :id, :_destroy]
      )
    end
  end
end
