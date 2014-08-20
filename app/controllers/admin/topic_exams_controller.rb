module Admin
  class TopicExamsController < AdminController
    def index
      authorize :topic_exam
      @search = TopicExam.search params[:q]
      @topic_exams = @search.result.page(params[:page]).per(10)
      respond_to do |format|
        format.html
        format.csv{ send_data TopicExamExporter.new(@search.result).export, :filename => "专题考核列表.csv" }
      end
    end
  end
end
