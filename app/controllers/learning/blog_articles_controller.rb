module Learning
  class BlogArticlesController < ApplicationController
  
    layout 'learning'
  
    load_and_authorize_resource :only => [:edit, :update, :destroy]
  
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
  
    private
  
    def find_blog_article
      @blog_article = BlogArticle.find params[:id]
    end
  
    def article_params
      params.require(:blog_article).permit(:title, :content)
    end
  end
end
