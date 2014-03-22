module Learning
  class TopicExamsController < LearningController
    before_action :find_topic_exam

    def show; end

    def submit
      if current_topic_learning.ready_for_exam?
        @topic_exam.submit
        flash[:notice] = '已交卷，请等待审核。'
        redirect_to @topic_exam
      else
        render :text => '该专题目前不能进行考试', :status => 400
      end
    end

    private

    def find_topic_exam
      @topic_exam = current_topic_learning.exams.find params[:id]
    end
  end
end
