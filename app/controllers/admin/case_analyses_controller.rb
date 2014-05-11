module Admin
  class CaseAnalysesController < AdminController

    before_action :find_case_analysis, :only => [:edit, :update, :destroy]

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

    def edit
      @case_analysis.videos.build if @case_analysis.videos.empty?
      @case_analysis.attachments.build
      render :new
    end

    def update
      if @case_analysis.update_attributes case_analysis_params
        flash[:notice] = "更新了案例《#{@case_analysis.title}》"
        redirect_to case_analyses_path
      else
        render :new
      end
    end

    private

    def find_case_analysis
      @case_analysis = CaseAnalysis.find params[:id]
    end

    def case_analysis_params
      params.require(:case_analysis).permit(:title, :content, :topic_id, 
        :videos_attributes => [:name, :url, :_destroy, :id],
        :attachments_attributes => [:file, :id, :_destroy]
      )
    end
  end
end
