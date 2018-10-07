# Managing catalogs
class CatalogsController < ApplicationController
  before_action :load_catalog, only: [:show, :update, :destroy]

  # GET /catalogs
  def index
    @catalogs = Catalog.all
    json_response(@catalogs)
  end

  # POST /catalogs
  def create
    @catalog = Catalog.create!(catalog_params)
    json_response(@catalog, :created)
  end

  # GET /catalog/:id
  def show
    json_response(@catalog)
  end

  # PATCH /catalog/:id
  def update
    @catalog.update(catalog_params)
    head :no_content
  end

  # DELETE /catalog/:id
  def destroy
    @catalog.destroy
    head :no_content
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
