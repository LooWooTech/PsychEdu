module Learning
  class ProfilesController < LearningController
    skip_before_action :ensure_topic_open
    skip_before_action :ensure_topic_learning_is_ongoing

    def show; end
  end
end
