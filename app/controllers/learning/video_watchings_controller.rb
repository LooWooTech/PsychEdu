module Learning
  class VideoWatchingsController < LearningController
    def update
      @video_watching = VideoWatching.find params[:id]
      @video_watching.update_attribute :playing_data, params[:data]
      render :nothing => true
    end
  end
end
