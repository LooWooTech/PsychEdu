module Admin
  class ForumsController < AdminController
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
        redirect_to forums_path
      else
        render :new
      end
    end

    private

    def forum_params
      params.require(:forum).permit(:name, :catalog_id)
    end
  end
end
