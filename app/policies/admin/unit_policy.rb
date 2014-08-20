module Admin
  class UnitPolicy
    def initialize(user, unit)
      @user = user
      @unit = unit
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

    def index?
      @user.super_admin? || @user.unit_admin?
    end

    def show?
      index?
    end
  end
end
