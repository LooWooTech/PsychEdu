class TopicExamAssignmentPolicy
  def initialize(user, assignment)
    @user = user
    @assignment = assignment
  end

  def index?
    @user.super_admin?
  end

  def destroy?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end
end
