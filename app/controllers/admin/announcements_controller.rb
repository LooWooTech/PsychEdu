module Admin
  class AnnouncementsController < AdminController
    before_filter :find_topic, :only => [:new, :create]
    before_filter :find_announcement, :only => [:edit, :update, :destroy]
    def new
      @announcement = @topic.announcements.build
    end

    def create
      @announcement = @topic.announcements.create announcement_params
      redirect_to @topic
    end

    def edit
      render :new
    end

    def update
      @announcement.update_attributes announcement_params
      redirect_to @announcement.topic
    end

    def destroy
      @announcement.destroy
      redirect_to @announcement.topic
    end

    private

    def announcement_params
      params.require(:announcement).permit(:title, :content)
    end

    def find_announcement
      @announcement = Announcement.find params[:id]
    end

    def find_topic
      @topic = Topic.find params[:topic_id]
    end
  end
end
