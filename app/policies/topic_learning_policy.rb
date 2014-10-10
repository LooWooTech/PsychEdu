class TopicLearningPolicy
  def initialize(user, topic_learning)
    @user = user
    @topic_learning = topic_learning
  end

  def index?
    @user.super_admin? || @user.unit_admin?
  end

  def create?
    @user.super_admin?
  end

  def destroy?
    create?
  end

end
