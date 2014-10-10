class TopicPolicy
  def initialize(user, topic)
    @user = user
    @topic = topic
  end

  def index?
    @user.super_admin? || @user.unit_admin?
  end

  def show?
    true
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

  def destroy?
    new?
  end
end
