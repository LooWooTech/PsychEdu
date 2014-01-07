module Learning
  class UnitLearningsController < LearningController
    helper_method :current_chapter_learning

    def show
      @unit_learning = UnitLearning.find params[:id]
      if @unit_learning.open?
        @video_watching = @unit_learning.video_watchings.first
        render 'learning/video_watchings/show'
      else
        render :text => '该单元尚未开放，请先通过前一单元的测试。'
      end
    end

    private

    def current_chapter_learning
      @unit_learning.chapter_learning
    end
  end
end
