module Learning
  class TopicLearningsController < LearningController
    belongs_to_module :learning

    skip_before_action :ensure_topic_learning_is_ongoing, :only => [:index, :show]

    def show
      self.current_topic_learning = current_user.topic_learnings.find params[:id]
      redirect_to learning_root_path
    end

    def exam
      if current_topic_learning.ready_for_exam?
        @topic_exam = current_topic_learning.last_exam
        render 'learning/topic_exams/show'
      else
        render :text => '该专题目前不能进行考试', :status => 400
      end
    end

    def guide
      @video_url = current_topic_learning.guide_video_url
      @title = "专题导学：#{current_topic_learning.name}"
      render 'learning/shared/video_watching'
    end
  end
end
