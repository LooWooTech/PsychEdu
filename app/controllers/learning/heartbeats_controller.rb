module Learning
  class HeartbeatsController < LearningController
    def create
      current_topic_learning.heartbeat
      render :nothing => true
    end
  end
end
