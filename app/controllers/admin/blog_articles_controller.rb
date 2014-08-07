module Admin
  class BlogArticlesController < AdminController
    before_action :find_blog_article, :only => [:edit, :update, :accept_publishing, :reject_publishing]

    def index
      @search = BlogArticle.requested_publishing.search params[:q]
      @blog_articles = @search.result.page(params[:page]).per(10)
    end

    def edit; end

    def update
      if @blog_article.update_attributes blog_params
        if params[:commit] == '通过'
          @blog_article.accept_publishing
          flash[:notice] = "您通过了《#{@blog_article.title}》的发表"
        else
          @blog_article.reject_publishing
          flash[:notice] = "您退回了《#{@blog_article.title}》的发表"
        end
        redirect_to admin_blog_articles_path
      else
        render :edit
      end
    end

    def accept_publishing
      @blog_article.accept_publishing
      flash[:notice] = "您通过了《#{@blog_article.title}》的发表"
      redirect_to admin_blog_articles_path
    end

    def reject_publishing
      @blog_article.reject_publishing
      flash[:notice] = "您退回了《#{@blog_article.title}》的发表"
      redirect_to admin_blog_articles_path
    end

    private
    
    def find_blog_article
      @blog_article = BlogArticle.find params[:id]
    end

    def blog_params
      params.require(:blog_article).permit(:title, :content)
    end
  end
end
