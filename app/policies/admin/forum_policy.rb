module Admin
  class ForumPolicy
    def initialize(user, forum)
      @user = user
      @forum = forum
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

    def destroy?
      new?
    end
  end
end
