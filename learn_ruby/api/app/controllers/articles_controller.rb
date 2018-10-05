class ArticlesController < ApplicationController

  # https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
  before_action :load_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
    json_response(@articles)
  end

  # POST /articles
  def create
    @article = Article.create!(article_params)
    json_response(@article, :created)
  end

  # GET /article/:id
  def show
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
