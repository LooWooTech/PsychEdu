module Admin
  class TopicLearningsController < AdminController

    def index
      @search = TopicLearning.search params[:q]
      @topic_learnings = @search.result.page(params[:page]).per(10)
    end

    def create
      @student = Student.find params[:student_id]
      @topic_learning = @student.topic_learnings.build topic_learning_params
      if @topic_learning.save
        render :text => student_path(@student)
      else
        render :status => 400, :text => @topic_learning.errors.full_messages.map{|msg| "<li>#{msg}</li>"}.join
      end
    end

    def destroy
      @topic_learning = TopicLearning.find params[:id]
      @topic_learning.destroy
      flash[:notice] = "#{@topic_learning.student_name}的#{@topic_learning.name}报名已经被删除"
      redirect_to topic_learnings_path
    end

    private
    
    def topic_learning_params
      params.require(:topic_learning).permit(:topic_id, :learning_periods_attributes => [:start_on, :end_on])
    end
  end
end
