module Admin
  class TopicLearningsController < AdminController

    def index
      authorize :topic_learning
      @search = current_user.managed_topic_learnings.search params[:q]
      @topic_learnings = @search.result.page(params[:page]).per(10)
    end

    def create
      authorize :topic_learning
      @student = Student.find params[:student_id]
      @topic_learning = @student.topic_learnings.build topic_learning_params
      if @topic_learning.save
        @topic_learning.learning_periods.each &:accepted!
        render :plain => admin_student_path(@student)
      else
        render :status => 400, :plain => @topic_learning.errors.full_messages.map{|msg| "<li>#{msg}</li>"}.join
      end
    end

    def destroy
      @topic_learning = TopicLearning.find params[:id]
      authorize @topic_learning

      @topic_learning.destroy
      flash[:notice] = "您删除了#{@topic_learning.student_name}的#{@topic_learning.name}报名"
      redirect_to admin_topic_learnings_path
    end

    private
    
    def topic_learning_params
      params.require(:topic_learning).permit(:topic_id, :learning_periods_attributes => [:start_on, :end_on])
    end
  end
end
