class BlogArticlesController < ApplicationController
  def index
    @blog_articles = BlogArticle.published.page(params[:page]).per(10)
  end

  def show
    @blog_article = BlogArticle.published.find params[:id]
  end
end
