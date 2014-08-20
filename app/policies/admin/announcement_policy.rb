module Admin
  class AnnouncementPolicy
    def initialize(user, announcement)
      @user = user
      @announcement = announcement
    end

    def index?
      @user.super_admin? || @user.unit_admin?
    end

    def show?
      index?
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
end
