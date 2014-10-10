class TopicTestingPolicy
  def initialize(user, topic_testing)
    @user = user
    @topic_testing = topic_testing
  end

  def index?
    @user.super_admin? || @user.unit_admin?
  end

  def new?
    @user.super_admin?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def show?
    index?
  end
end
