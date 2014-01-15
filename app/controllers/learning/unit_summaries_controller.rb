module Learning
  class UnitSummariesController < LearningController
    def show
      @unit_learning = UnitLearning.find params[:id]
    end
  end
end
