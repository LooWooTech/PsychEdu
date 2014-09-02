module Admin
  class SettingPolicy
    def initialize(user, setting)
      @user = user
      @setting = setting
    end

    def edit?
      @user.super_admin?
    end

    def update?
      edit?
    end
  end
end
