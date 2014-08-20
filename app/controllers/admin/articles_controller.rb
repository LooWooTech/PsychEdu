module Admin
  class ArticlesController < AdminController
    before_action :find_article_and_authorize, :only => [:show, :edit, :update, :destroy]

    def index
      authorize :article
      @search = Article.search params[:q]
      @articles = @search.result.page(params[:page]).per(10)
    end

    def show; end

    def new
      authorize :article
      @article = Article.new
    end

    def create
      authorize :article
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

    def find_article_and_authorize
      @article = Article.find params[:id]
      authorize @article
    end
  end
end
