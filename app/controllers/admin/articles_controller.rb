module Admin
  class ArticlesController < AdminController
    before_action :find_article, :only => [:edit, :update, :destroy]

    def index
      @search = Article.search params[:q]
      @articles = @search.result.page(params[:page]).per(10)
    end

    def new
      @article = Article.new
    end

    def create
      @article = current_user.published_articles.build article_params
      if @article.save
        flash[:notice] = "您新建了文章《#{@article.title}》"
        redirect_to admin_articles_path
      else
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @article.update_attributes article_params
        flash[:notice] = "您编辑了文章《#{@article.title}》"
        redirect_to admin_articles_path
      else
        render :new
      end
    end

    def destroy
      @article.destroy
      flash[:notice] = "您删除了文章《#{@article.title}》"
      redirect_to admin_articles_path
    end

    private

    def article_params
      params.require(:article).permit!
    end

    def find_article
      @article = Article.find params[:id]
    end
  end
end
