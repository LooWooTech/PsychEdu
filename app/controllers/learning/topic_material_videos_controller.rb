module Learning
  class TopicMaterialVideosController < LearningController
    belongs_to_module :material
    def show
      @video = TopicMaterialVideo.find params[:id]
      @video_url = @video.url
      @title = @video.name
      render 'learning/shared/video_watching'
    end
  end
end
