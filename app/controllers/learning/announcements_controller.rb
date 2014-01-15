module Learning
  class AnnouncementsController < LearningController
    def show
      @announcement = Announcement.find params[:id]
    end
  end
end
