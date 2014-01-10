module Learning
  class TopicLearningsController < LearningController
    def show
      self.current_topic_learning = current_user.topic_learnings.find params[:id]
      render 'learning/chapter_learnings/index'
    end
  end
end
