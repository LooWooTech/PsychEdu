module Admin
  class CaseAnalysesController < AdminController
    def index
      @search = CaseAnalysis.search params[:q]
      @case_analyses = @search.result.page(params[:page]).per(10)
    end

    def new
      @case_analysis = CaseAnalysis.new
      @case_analysis.videos.build
      @case_analysis.attachments.build
    end

    def create
      @case_analysis = current_user.case_analyses.build case_analysis_params
      if @case_analysis.save
        flash[:notice] = "新增了案例《#{@case_analysis.title}》"
        redirect_to case_analyses_path
      else
        render :new
      end
    end

    private

    def case_analysis_params
      params.require(:case_analysis).permit(:title, :content, :topic_id, 
        :videos_attributes => [:name, :url, :_destroy, :id],
        :attachments_attributes => [:file, :id, :_destroy]
      )
    end
  end
end
