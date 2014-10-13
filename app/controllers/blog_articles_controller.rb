class BlogArticlesController < ApplicationController
  def index
    @articles = BlogArticle.published.page(params[:page]).per(10)
    render 'articles/index'
  end

  def show
    @article = BlogArticle.published.find params[:id]
    render 'articles/show'
  end
end
