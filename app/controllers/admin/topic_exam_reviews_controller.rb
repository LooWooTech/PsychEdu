module Admin
  class TopicExamReviewsController < AdminController
    def index
      authorize :topic_exam, :review?
      @search = TopicExam.unreviewed.search params[:q]
      @topic_exams = @search.result.page(params[:page]).per(10)
    end

    def show
      authorize :topic_exam, :review?
      @topic_exam = TopicExam.submitted.find params[:id]
    end

    def update
      authorize :topic_exam, :review?
      @topic_exam = TopicExam.find params[:id]
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
