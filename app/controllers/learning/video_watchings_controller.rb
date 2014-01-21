module Learning
  class VideoWatchingsController < LearningController
    helper_method :current_chapter_learning
    before_action :find_video_watching, :only => [:show, :update]

    def show; end

    def update
      @video_watching.update_attribute :playing_data, params[:data]
      render :nothing => true
    end

    private

    def find_video_watching
      @video_watching = VideoWatching.find params[:id]
    end

    def current_chapter_learning
      @video_watching.chapter_learning
    end
  end
end
