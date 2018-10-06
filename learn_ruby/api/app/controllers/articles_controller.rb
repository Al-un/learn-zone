# Handling articles exposition with articles within catalogs (index & show only)
class ArticlesController < ApplicationController

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
    json_response(@articles)
  end

  # POST /articles
  def create
    @article = Article.create!(article_params)
    json_response(@article, :created)
  end

  # GET /article/:id
  # Need to check if getting articles from a catalog or not
  def show
    if (params.has_key?(:catalog_id))
      @article = Catalog.find(params[:catalog_id]).articles.find(params[:id])
    else
      @article = Article.find(params[:id])
    end
    json_response(@article)
  end

  # PATCH /article/:id 
  # !! This is not PUT !!
  def update
    @article.update(article_params)
    head :no_content
  end

  # DELETE /article/:id
  def destroy
    @article.destroy
    head :no_content
  end

  private # --------------------------------------------------------------------

  def article_params
    params.permit(:name, :description)
  end

  def load_article
    @article = Article.find(params[:id])
  end

end
