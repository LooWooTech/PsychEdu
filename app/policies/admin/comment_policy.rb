module Admin
  class CommentPolicy
    def initialize(user, comment)
      @user = user
      @comment = comment
    end

    def index?
      @user.super_admin?
    end

    def show?
      index?
    end

    def destroy?
      index?
    end
  end
end
