module Learning
  class TopicLearningsController < LearningController
    def show
      self.current_user_learning = current_user.topic_learnings.find params[:id]
      render 'learning/course_learnings/index'
    end
  end
end
