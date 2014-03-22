module Learning
  class TopicLearningsController < LearningController
    def show
      self.current_topic_learning = current_user.topic_learnings.find params[:id]
      render 'learning/chapter_learnings/index'
    end

    def exam
      if current_topic_learning.ready_for_exam?
        @topic_exam = current_topic_learning.last_exam
        render 'learning/topic_exams/show'
      else
        render :text => '该专题目前不能进行考试', :status => 400
      end
    end
  end
end
