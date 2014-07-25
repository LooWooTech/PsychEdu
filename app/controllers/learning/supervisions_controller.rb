module Learning
  class SupervisionsController < LearningController
    belongs_to_module :supervision
    def show
      @supervision = current_topic_learning.supervision
    end
  end
end
