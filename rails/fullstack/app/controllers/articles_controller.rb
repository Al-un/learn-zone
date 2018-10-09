# Handling articles exposition with articles within catalogs (index & show only)
class ArticlesController < ApplicationController
  include FullySecured

  # https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
  before_action :load_article, only: [:update, :destroy]

  # GET /articles
  # Need to check if getting articles from a catalog or not
  def index
    if (params.has_key?(:catalog_id))
      @articles = Catalog.find(params[:catalog_id]).articles
    else
      @articles = Article.all
    end
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = Article.create!(article_params)
    redirect_to articles_path
  end

  # GET /article/:id
  # Need to check if getting articles from a catalog or not
  def show
    if (params.has_key?(:catalog_id))
      @article = Catalog.find(params[:catalog_id]).articles.find(params[:id])
    else
      @article = Article.find(params[:id])
    end
  end

  # PATCH /article/:id 
  # !! This is not PUT !!
  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  # DELETE /article/:id
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private # --------------------------------------------------------------------

  def article_params
    params.require(:article).permit(:name, :description)
  end

  def load_article
    @article = Article.find(params[:id])
  end

end
