module Admin
  class AdministratorPolicy
    def initialize(user, admin)
      @user = user
      @admin = admin
    end

    def index?
      @user.super_admin?
    end

    def new?
      index?
    end

    def create?
      index?
    end

    def edit?
      index?
    end

    def update?
      index?
    end

    def destroy?
      index?
    end
  end
end
