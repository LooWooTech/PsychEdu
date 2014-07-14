module Learning
  class BlogArticlesController < ApplicationController
    belongs_to_module :personal
  
    layout 'learning'
  
    load_and_authorize_resource :only => [:edit, :update, :destroy, :request_publishing, :unpublish]
  
    before_action :student_required
    before_action :find_blog_article, :only => [:show]
  
    def index
      @blog_articles = current_user.blog_articles
    end
  
    def new
      @blog_article = BlogArticle.new
    end
  
    def create
      @blog_article = current_user.blog_articles.build article_params
      if @blog_article.save
        redirect_to [:learning, @blog_article]
      else
        render :new
      end
    end
  
    def show; end
  
    def edit
      render :new
    end
  
    def update
      if @blog_article.update_attributes article_params
        redirect_to [:learning, @blog_article]
      else
        render :new
      end
    end
  
    def destroy
      @blog_article.destroy
      flash[:notice] = "您删除了文章《#{@blog_article.title}》"
      redirect_to learning_blog_articles_path
    end

    def request_publishing
      @blog_article.request_publishing
      flash[:notice] = "您申请了发表文章《#{@blog_article.title}》"
      redirect_to [:learning, @blog_article]
    end

    def unpublish
      @blog_article.unpublish
      flash[:notice] = "您撤消了文章《#{@blog_article.title}》的发表"
      redirect_to [:learning, @blog_article]
    end
  
    private
  
    def find_blog_article
      @blog_article = BlogArticle.find params[:id]
    end
  
    def article_params
      params.require(:blog_article).permit(:title, :content)
    end
  end
end
