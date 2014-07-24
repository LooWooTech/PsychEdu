module Admin
  class StudentPolicy

    def initialize(user, student)
      @user = user
      @student = student
    end

    def create?
      @user.super_admin? || unit_admin?
    end

    def update?
      create?
    end

    def destroy?
      create?
    end

    def manage?
      @user.super_admin? || @user.unit_admin?
    end

    private

    def unit_admin?
      @user.unit_admin? && @user.unit_code == @student.unit_code
    end
  end
end
