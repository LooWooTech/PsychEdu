class ArticlesController < ApplicationController
  def index
    @articles = Article.where(:type => params[:type]).page(params[:page]).per(10)
  end

  def show
    @article = Article.find params[:id]
  end
end
