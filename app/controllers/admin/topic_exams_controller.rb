module Admin
  class TopicExamsController < AdminController
    def index
      @search = TopicExam.search params[:q]
      @topic_exams = @search.result.page(params[:page]).per(10)
    end
  end
end
