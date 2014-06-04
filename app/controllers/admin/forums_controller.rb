module Admin
  class ForumsController < AdminController

    before_action :find_forum, :only => [:edit, :update, :destroy]
    def index
      @forums = Forum.all
    end

    def new
      @forum = Forum.new
    end

    def create
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

    def find_forum
      @forum = Forum.find params[:id]
    end

    def forum_params
      params.require(:forum).permit(:name, :catalog_id)
    end
  end
end
