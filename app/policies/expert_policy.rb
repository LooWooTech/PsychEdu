class ExpertPolicy
  def initialize(user, expert)
    @user = user
    @expert = expert
  end

  def index?
    @user.super_admin?
  end
end
