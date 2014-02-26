module Learning
  class UnitLearningsController < LearningController

    before_action :find_unit_learning, :only => [:show, :summary, :review]

    def show
      if @unit_learning.open?
        @video_watching = @unit_learning.video_watchings.first
        @chapter_learning = @unit_learning.chapter_learning
        render 'learning/video_watchings/show'
      else
        render :text => '该单元尚未开放，请先通过前一单元的测试。'
      end
    end

    def summary; end

    def review; end

    private

    def find_unit_learning
      @unit_learning = UnitLearning.find params[:id]
    end
  end
end
