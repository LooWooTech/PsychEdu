class TopicExamPolicy
  def initialize(user, topic_exam)
    @user = user
    @topic_exam = topic_exam
  end

  def index?
    @user.super_admin? || @user.unit_admin?
  end

  def review?
    return true if @user.super_admin?
    if @user.expert?
      if @topic_exam.is_a? TopicExam
        return @user.assigned_topic_ids.include? @topic_exam.topic_learning.topic_id
      end
      return true
    end
    false
  end
end
