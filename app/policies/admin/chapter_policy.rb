module Admin
  class ChapterPolicy
    def initialize(user, chapter)
      @user = user
      @chapter = chapter
    end

    def create?
      @user.super_admin?
    end

    def edit?
      create?
    end

    def destroy?
      create?
    end

    def show?
      index?
    end

    def index?
      @user.super_admin? || @user.unit_admin?
    end
  end
end
