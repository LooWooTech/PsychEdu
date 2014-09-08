module Admin
  class ComplaintsController < AdminController

    before_action :find_complaint_and_authorize, :only => [:show, :processed, :ignored]
    def index
      authorize :complaint
      @search = Complaint.search params[:q]
      @complaints = @search.result.order('created_at DESC')
    end

    def show; end

    def processed
      @complaint.process
      flash[:notice] = "您处理了 #{@complaint.complainer_name} 的举报"
      redirect_to admin_complaints_path
    end

    def ignored
      @complaint.ignore
      flash[:notice] = "您处理了 #{@complaint.complainer_name} 的举报"
      redirect_to admin_complaints_path
    end

    private

    def find_complaint_and_authorize
      @complaint = Complaint.find params[:id]
      authorize @complaint
    end
  end
end
