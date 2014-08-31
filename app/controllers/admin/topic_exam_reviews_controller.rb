module Admin
  class TopicExamReviewsController < AdminController
    def index
      authorize :topic_exam, :review?
      if current_user.super_admin?
        @search = TopicExam.unreviewed.search params[:q]
      else
        @search = current_user.assigned_topic_exams.unreviewed.search params[:q]
      end
      @topic_exams = @search.result.page(params[:page]).per(10)
    end

    def show
      @topic_exam = TopicExam.find params[:id]
      authorize @topic_exam, :review?
    end

    def update
      @topic_exam = TopicExam.find params[:id]
      authorize @topic_exam, :review?
      if @topic_exam.update_attributes review_params
        flash[:notice] = '您更新了评分'
        redirect_to admin_topic_exam_review_path(@topic_exam)
      else
        render :show
      end
    end

    private

    def review_params
      params.require(:topic_exam).permit!
    end
  end
end
