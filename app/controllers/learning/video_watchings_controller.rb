module Learning
  class VideoWatchingsController < LearningController
    before_action :find_video_watching, :only => [:show, :update]

    def show
      @unit_learning = @video_watching.unit_learning
      @chapter_learning = @unit_learning.chapter_learning
    end

    def update
      @video_watching.update_attribute :playing_data, params[:data]
      render :nothing => true
    end

    private

    def find_video_watching
      @video_watching = VideoWatching.find params[:id]
    end

  end
end
