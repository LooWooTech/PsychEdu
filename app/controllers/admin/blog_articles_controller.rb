module Admin
  class BlogArticlesController < AdminController
    before_action :find_blog_article, :only => [:show, :accept_publishing, :reject_publishing]

    def index
      @search = BlogArticle.requested_publishing.search params[:q]
      @blog_articles = @search.result.page(params[:page]).per(10)
    end

    def show; end

    def accept_publishing
      @blog_article.accept_publishing
      flash[:notice] = "您同意了《#{@blog_article.title}》的发表"
      redirect_to admin_blog_articles_path
    end

    def reject_publishing
      @blog_article.reject_publishing
      flash[:notice] = "您拒绝了《#{@blog_article.title}》的发表"
      redirect_to admin_blog_articles_path
    end

    private
    
    def find_blog_article
      @blog_article = BlogArticle.find params[:id]
    end
  end
end
