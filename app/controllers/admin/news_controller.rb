module Admin
  class NewsController < AdminController

    before_action :find_news, :only => [:edit, :update, :destroy]

    def index
      @search = News.search params[:q]
      @news = @search.result.page(params[:page]).per(10)
    end

    def new
      @news = News.new
      @news.videos.build
    end

    def create
      @news = current_user.published_news.build news_params
      if @news.save
        flash[:notice] = "您发布了资讯《#{@news.title}》"
        redirect_to admin_news_index_path
      else
        @news.videos.build if @news.videos.empty?
        render :new
      end
    end

    def edit
      render :new
    end

    def update
      if @news.update_attributes news_params
        flash[:notice] = "您编辑了资讯《#{@news.title}》"
        redirect_to admin_news_index_path
      else
        render :new
      end
    end

    def destroy
      @news.destroy
      flash[:notice] = "您删除了资讯《#{@news.title}》"
      redirect_to admin_news_index_path
    end

    private

    def find_news
      @news = News.find params[:id]
    end

    def news_params
      params.require(:news).permit!
    end
  end
end
