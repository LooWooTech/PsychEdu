module Admin
  class TopicExamAssignmentsController < AdminController

    def index
      @search = TopicExam.assigned.search params[:q]
      @topic_exams = @search.result.order('created_at DESC').page(params[:page]).per(10)
    end

    def new
      @expert = Administrator.find params[:expert_id]
      @unassigned_topic_exams = TopicExam.unassigned_for @expert
    end

    def create
      @expert = Administrator.find params[:expert_id]
      params[:topic_exam_ids].each do |id|
        TopicExam.find(id).update_attribute :reviewer_id, @expert.id
      end
      flash[:notice] = "您为 #{@expert.username} 分配了试卷"
      redirect_to admin_topic_exam_assignments_path
    end

    def destroy
      @topic_exam = TopicExam.find params[:id]
      @topic_exam.update_attribute :reviewer_id, nil
      flash[:notice] = "您取消了试卷分配"
      redirect_to admin_topic_exam_assignments_path
    end
  end
end
