module Learning
  class AnnouncementsController < LearningController
    belongs_to_module :learning
    def show
      @announcement = Announcement.find params[:id]
    end
  end
end
