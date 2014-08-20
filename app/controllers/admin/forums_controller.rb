module Admin
  class ForumsController < AdminController

    before_action :find_forum_and_authorize, :only => [:edit, :update, :destroy]

    def index
      authorize :forum
      @forums = Forum.all
    end

    def new
      authorize :forum
      @forum = Forum.new
    end

    def create
      authorize :forum
      @forum = Forum.new forum_params
      if @forum.save
        flash[:notice] = "您创建了 #{@forum.name}"
        redirect_to admin_forums_path
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @forum.update_attributes forum_params
        flash[:notice] = "您修改了 #{@forum.name}"
        redirect_to admin_forums_path
      else
        render :new
      end
    end

    def destroy
      @forum.destroy
      flash[:notice] = "您删除了 #{@forum.name}"
      redirect_to admin_forums_path
    end

    private

    def find_forum_and_authorize
      @forum = Forum.find params[:id]
      authorize @forum
    end

    def forum_params
      params.require(:forum).permit(:name, :catalog_id)
    end
  end
end
