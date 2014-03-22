module Admin
  class TopicExamsController < AdminController
    def index
      @topic_exams = TopicExam.page(params[:page]).per(10)
    end

    def show
      @topic_exam = TopicExam.find params[:id]
    end

    def review
      @topic_exam = TopicExam.unreviewed.find params[:id]
      if @topic_exam.update_attributes review_params
        redirect_to topic_exam_path(@topic_exam)
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
