module Learning
  class ChapterLearningsController < LearningController
    belongs_to_module :learning
    def index; end
  end
end
