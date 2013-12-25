module Learning
  class UnitLearningsController < LearningController
    helper_method :current_chapter_learning

    def show
      @unit_learning = UnitLearning.find params[:id]
      @video_watching = @unit_learning.video_watchings.first
      render 'learning/video_watchings/show'
    end

    private

    def current_chapter_learning
      @unit_learning.chapter_learning
    end
  end
end
