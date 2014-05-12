module Learning
  class CaseVideosController < LearningController
    def show
      @video = CaseVideo.find params[:id]
      @video_url = @video.url
      @title = @video.name
      render 'learning/shared/video_watching'
    end
  end
end
