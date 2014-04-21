module Learning
  class PeriodsController < LearningController
    skip_before_action :ensure_topic_learning_is_ongoing

    def create
      @start_on = Date.parse params[:start_on]
      @end_on = Date.parse params[:end_on] if params[:end_on].present?
      @topic_learning = TopicLearning.find params[:topic_learning_id]
      if @topic_learning.has_unreviewed_application?
        render :plain => '上一个申请还未审核', :status => 400
        return
      else
        case  params[:type]
        when'learning'
          @period = @topic_learning.start @start_on, @end_on
        when 'leaving'
          @period = @topic_learning.leave @start_on, @end_on
          if @period.nil?
            render :plain => '不在学习周期内', :status => 400
            return
          end
        when 'resuming'
          @period = @topic_learning.resume @start_on
          if @period.nil?
            render :plain => '不在休学周期内', :status => 400
            return
          end
        end
        if @period.invalid?
          render :plain => @period.errors.full_messages.join(", "), :status => 400
        else
          render :plain => '申请成功，请等待审核。', :status => 200
        end
      end
    end

    def destroy
      @period_application = PeriodApplication.find params[:id]
      @period_application.destroy
      flash[:notice] = '撤消成功'
      redirect_to periods_path
    end
  end
end
