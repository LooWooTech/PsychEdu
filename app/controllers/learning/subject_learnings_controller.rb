module Learning
  class SubjectLearningsController < LearningController
    def show
      self.current_user_learning = current_user.subject_learnings.find params[:id]
      render 'learning/course_learnings/index'
    end
  end
end
