module Admin
  class PeriodApplicationsController < AdminController

    before_action :find_period_application, :only => [:accept, :reject]

    def index
      authorize :period_application
      @search = current_user.managed_period_applications.search params[:q]
      @search.review_state_eq ||= PeriodApplication.review_states[:unreviewed]
      @period_applications = @search.result.page(params[:page]).per(10)
    end

    def accept
      @period_application.accepted!
      flash[:notice] = "您同意了#{@period_application.student_name}的申请"
      redirect_to admin_period_applications_path
    end

    def reject
      @period_application.rejected!
      flash[:notice] = "您拒绝了#{@period_application.student_name}的申请"
      redirect_to admin_period_applications_path
    end

    private

    def find_period_application
      @period_application = PeriodApplication.find params[:id]
      authorize @period_application
    end
  end
end
