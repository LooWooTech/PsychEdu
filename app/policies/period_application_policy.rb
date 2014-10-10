class PeriodApplicationPolicy
  def initialize(user, period)
    @user = user
    @period = period
  end

  def index?
    @user.super_admin? || @user.unit_admin?
  end
  
  def audit?
    @user.super_admin?
  end

  def accept?
    audit?
  end

  def reject?
    audit?
  end
end
LearningPeriodPolicy = LeavingPeriodPolicy = LeavingPeriodResumingPolicy = PeriodApplicationPolicy
