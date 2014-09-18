module Learning
  class TopicMaterialVideosController < LearningController
    belongs_to_module :material
    def show
      @video = TopicMaterialVideo.find params[:id]
    end
  end
end
