module Admin
  class AnnouncementsController < AdminController
    before_action :find_announcement_and_authorize, :only => [:show, :edit, :update, :destroy]

    def index
      authorize :announcement
      @search = Announcement.search params[:q]
      @announcements = @search.result.page(params[:page]).per(10)
    end

    def new
      authorize :announcement
      @announcement = Announcement.new
    end

    def create
      authorize :announcement
      @announcement = current_user.announcements.build announcement_params
      if @announcement.save
        flash[:notice] = "您创建了通知：#{@announcement.title}"
        redirect_to [:admin, @announcement]
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      @announcement.update_attributes announcement_params
      flash[:notice] = "您更新了通知：#{@announcement.title}"
      redirect_to admin_announcements_path
    end

    def destroy
      @announcement.destroy
      flash[:notice] = "您删除了通知：#{@announcement.title}"
      redirect_to admin_announcements_path
    end

    private

    def announcement_params
      params.require(:announcement).permit(:title, :content, :topic_id)
    end

    def find_announcement_and_authorize
      @announcement = Announcement.find params[:id]
      authorize @announcement
    end
  end
end
