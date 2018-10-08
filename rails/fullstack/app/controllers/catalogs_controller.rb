# Managing catalogs
class CatalogsController < ApplicationController
  include Secured
  before_action :load_catalog, only: [:show, :update, :destroy]
  before_action :logged_in?, except: [:index]

  # GET /catalogs
  def index
    @catalogs = Catalog.all
  end

  # POST /catalogs
  def create
    @catalog = Catalog.create!(catalog_params)
  end

  # GET /catalog/:id
  def show
    @catalog
  end

  # PATCH /catalog/:id
  def update
    @catalog.update(catalog_params)
  end

  # DELETE /catalog/:id
  def destroy
    @catalog.destroy
  end

  private # --------------------------------------------------------------------

  def catalog_params
    # http://patshaughnessy.net/2014/6/16/a-rule-of-thumb-for-strong-parameters
    params.permit(:code, :name, :description, :article_ids => [])
  end

  def load_catalog
    @catalog = Catalog.find(params[:id])
  end

end
