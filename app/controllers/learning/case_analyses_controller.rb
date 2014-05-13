module Learning
  class CaseAnalysesController < LearningController
    def index
      @case_analyses = current_topic_learning.case_analyses.order('created_at DESC').page(params[:page]).per(20)
    end

    def show
      @case_analysis = CaseAnalysis.find params[:id]
    end
  end
end
