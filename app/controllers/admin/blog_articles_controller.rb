module Admin
  class BlogArticlesController < AdminController
    before_action :find_blog_article, :only => [:show, :publish, :un_publish]

    def index
      @search = BlogArticle.search params[:q]
      @blog_articles = @search.result.page(params[:page]).per(10)
    end

    def show; end

    def publish
      @blog_article.publish!
      flash[:notice] = "您把《#{@blog_article.title}》发布到了首页"
      redirect_to admin_blog_articles_path
    end

    def un_publish
      @blog_article.un_publish!
      flash[:notice] = "您取消了《#{@blog_article.title}》的发布"
      redirect_to admin_blog_articles_path
    end

    private
    
    def find_blog_article
      @blog_article = BlogArticle.find params[:id]
    end
  end
end
