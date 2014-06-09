module Learning
  class TopicMaterialVideosController < LearningController
    def show
      @video = TopicMaterialVideo.find params[:id]
      @video_url = @video.url
      @title = @video.name
      render 'learning/shared/video_watching'
    end
  end
end