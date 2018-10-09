# Managing catalogs
class CatalogsController < ApplicationController
  include Secured
  before_action :load_catalog, only: [:show, :update, :destroy]
  before_action :logged_in?, except: [:index]

  # GET /catalogs
  def index
    @catalogs = Catalog.all
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # POST /catalogs
  def create
    @catalog = Catalog.create!(catalog_params)
    redirect_to catalogs_path
  end

  # GET /catalog/:id
  def show
    @articles = Article.all
  end

  # PATCH /catalog/:id
  def update
    @catalog.update(catalog_params)
    redirect_to catalogs_path
  end

  # DELETE /catalog/:id
  def destroy
    @catalog.destroy
    redirect_to catalogs_path
  end

  private # --------------------------------------------------------------------

  def catalog_params
    # http://patshaughnessy.net/2014/6/16/a-rule-of-thumb-for-strong-parameters
    params.require(:catalog).permit(:code, :name, :description, :article_ids => [])
  end

  def load_catalog
    @catalog = Catalog.find(params[:id])
  end

end
