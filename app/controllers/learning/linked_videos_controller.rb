module Learning
  class LinkedVideosController < LearningController
    def show
      @linked_video = LinkedVideo.find params[:id]
    end
  end
end
