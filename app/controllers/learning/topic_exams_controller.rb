module Learning
  class TopicExamsController < LearningController
    belongs_to_module :learning
    before_action :find_topic_exam, :only => [:show, :submit]

    def index
      @topic_exams = current_topic_learning.exam_history
    end

    def show; end

    def submit
      if current_topic_learning.ready_for_exam?
        @topic_exam.submit
        flash[:notice] = '已交卷，请等待审核。'
        redirect_to [:learning, @topic_exam]
      else
        render :plain => '该专题目前不能进行考试', :status => 400
      end
    end

    private

    def find_topic_exam
      @topic_exam = current_topic_learning.exams.find params[:id]
    end
  end
end
