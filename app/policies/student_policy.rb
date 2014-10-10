class StudentPolicy

  def initialize(user, student)
    @user = user
    @student = student
  end

  def index?
    @user.super_admin? || @user.unit_admin?
  end

  def show?
    @user.super_admin? || (@user.unit_admin? && @user.unit_code == @student.unit_code)
  end

  def new?
    create?
  end

  def create?
    @user.super_admin?
  end

  def edit?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

end
