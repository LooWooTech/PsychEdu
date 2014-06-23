module Learning
  class ProfilesController < LearningController
    belongs_to_module :personal
    skip_before_action :ensure_topic_open
    skip_before_action :ensure_topic_learning_is_ongoing

    def show; end
  end
end
