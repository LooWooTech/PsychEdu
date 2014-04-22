module Admin
  class TopicExamReviewsController < AdminController
    def index
      @topic_exams = TopicExam.submitted.page(params[:page]).per(10)
    end

    def show
      @topic_exam = TopicExam.submitted.find params[:id]
    end

    def update
      @topic_exam = TopicExam.find params[:id]
      if @topic_exam.update_attributes review_params
        redirect_to topic_exam_review_path(@topic_exam)
      else
        render :show
      end
    end

    private

    def review_params
      params.require(:topic_exam).permit(:score, :review)
    end
  end
end
