class ArticlesController < ApplicationController
  def index
    articles = Article.recent.page(params[:page]).per_page(params[:per_page])
    render json: articles
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end
end