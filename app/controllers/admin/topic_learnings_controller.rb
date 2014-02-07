module Admin
  class TopicLearningsController < AdminController
    def create
      @student = Student.find params[:student_id]
      @topic_learning = @student.topic_learnings.build topic_learning_params
      if @topic_learning.save
        render :text => student_path(@student)
      else
        render :status => 400, :text => @topic_learning.errors.full_messages.map{|msg| "<li>#{msg}</li>"}.join
      end
    end

    private
    
    def topic_learning_params
      params.require(:topic_learning).permit(:topic_id, :learning_periods_attributes => [:start_on, :end_on])
    end
  end
end
