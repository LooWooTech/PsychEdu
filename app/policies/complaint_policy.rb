class ComplaintPolicy
  def initialize(user, complaint)
    @user = user
    @complaint = complaint
  end

  def index?
    @user.super_admin?
  end

  def processed?
    index?
  end

  def ignored?
    index?
  end

  def show?
    index?
  end
end
