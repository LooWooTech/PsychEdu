module Admin
  class AnnouncementsController < AdminController
    before_action :find_announcement, :only => [:show, :edit, :update, :destroy]

    def index
      @search = Announcement.search params[:q]
      @announcements = @search.result.page(params[:page]).per(10)
    end

    def new
      @announcement = Announcement.new
    end

    def create
      @announcement = current_user.announcements.create announcement_params
      redirect_to announcement_path(@announcement)
    end

    def edit
      render :new
    end

    def update
      @announcement.update_attributes announcement_params
      redirect_to announcement_path(@announcement)
    end

    def destroy
      @announcement.destroy
      redirect_to announcements_path
    end

    private

    def announcement_params
      params.require(:announcement).permit(:title, :content, :topic_id)
    end

    def find_announcement
      @announcement = Announcement.find params[:id]
    end
  end
end
