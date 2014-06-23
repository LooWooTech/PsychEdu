module Ask
  class ComplaintsController < AskController
    belongs_to_module :forum
  
    before_action :find_complainable
  
    def new
      @complaint = Complaint.new
      @title = '举报'
      render :new, :layout => false
    end
  
    def create
      @complaint = current_user.complaints.build complaint_params
      @complaint.complainable = @complainable
      if @complaint.save
        render :text => '谢谢，管理员已经收到您的举报，会尽快处理。'
      else
        render :text => '举报失败', :status => 400
      end
    end
  
    private
  
    def complaint_params
      params.require(:complaint).permit(:content)
    end
    
    def find_complainable
      @complainable = find_polymorphic_parent
    end
  end
end
