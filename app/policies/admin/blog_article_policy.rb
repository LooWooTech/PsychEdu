module Admin
  class BlogArticlePolicy
    def initialize(user, blog_article)
      @user = user
      @blog_article = blog_article
    end

    def index?
      true
    end

    def edit?
      @user.super_admin? || @user.expert?
    end
  end
end
