module Learning
  class UnitLearningsController < LearningController
    belongs_to_module :learning

    before_action :find_unit_learning, :only => [:show, :summary, :review]

    def show
      if @unit_learning.open?
        @video_watching = @unit_learning.video_watchings.first
        @chapter_learning = @unit_learning.chapter_learning
        render 'learning/video_watchings/show'
      else
        render :plain => '该单元尚未开放，可能是没有视频，或者前一单元的测试未通过。'
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
