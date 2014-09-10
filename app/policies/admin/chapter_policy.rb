module Admin
  class ChapterPolicy
    def initialize(user, chapter)
      @user = user
      @chapter = chapter
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

    def destroy?
      new?
    end

    def show?
      index?
    end

    def index?
      @user.super_admin? || @user.unit_admin?
    end
  end
end
