module Admin
  class TopicLearningsController < AdminController
    def create
      @student = Student.find params[:student_id]
      @topic_learning = @student.topic_learnings.build topic_learning_params
      if @topic_learning.save
        redirect_to @student
      else
        render :text => '开通专题失败'
      end
    end

    private
    
    def topic_learning_params
      params.require(:topic_learning).permit(:topic_id)
    end
  end
end
