module Learning
  class UnitLearningsController < LearningController
    helper_method :current_course_learning

    def show
      @unit_learning = UnitLearning.find params[:id]
      @video_watching = @unit_learning.video_watchings.first
      render 'learning/video_learnings/show'
    end

    private

    def current_course_learning
      @unit_learning.course_learning
    end
  end
end
