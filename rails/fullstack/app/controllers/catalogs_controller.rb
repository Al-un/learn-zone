# Managing catalogs
class CatalogsController < ApplicationController
  include Secured

  # ----------------------------------------------------------------------------

  # load catalog per id 
  before_action :load_catalog, only: [:show, :edit, :update, :destroy]
  # display only is opened to public
  before_action :logged_in?, except: [:index, :show] 

  # ----------------------------------------------------------------------------
  # GET /catalogs
  def index
    @catalogs = Catalog.all
      .includes(:article_publications)
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
    @articles = Article.all
  end

  # POST /catalogs
  def create
    @catalog = Catalog.create!(catalog_params)
    redirect_to catalog_path(@catalog)
  end

  # GET /catalog/:id
  def show
  end

  # GET /catalog/:id/edit
  def edit
    @articles = Article.all
  end

  # PATCH /catalog/:id
  def update
    @catalog.update(catalog_params)
    redirect_to catalog_path(@catalog)
  end

  # DELETE /catalog/:id
  def destroy
    @catalog.destroy
    redirect_to catalogs_path
  end

  private # --------------------------------------------------------------------

  def catalog_params
    # http://patshaughnessy.net/2014/6/16/a-rule-of-thumb-for-strong-parameters
    params.require(:catalog).permit(:code, :name, :description,
      article_publications_attributes: [
        :id, :_destroy, # https://github.com/nathanvda/cocoon#strong-parameters-gotcha
        :article_id
      ])
    # params.require(:catalog).permit(:code, :name, :description,
    #   article_publications_attributes: [
    #     :id, :_destroy, # https://github.com/nathanvda/cocoon#strong-parameters-gotcha
    #     article_attribute: [:name, :description]],
    #   :article_ids => [])
  end

  def load_catalog
    @catalog = Catalog.find(params[:id])
  end

end
