module Admin
  class MonthlyOnlineTrackingPolicy
    def initialize(user, tracking)
      @user = user
      @tracking = tracking
    end

    def index?
      @user.super_admin? || @user.unit_admin?
    end
  end
end
