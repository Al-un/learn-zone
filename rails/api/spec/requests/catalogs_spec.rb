# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Catalog API', type: :request do
  # initialise test data
  let!(:catalogs) { create_list(:catalog, 10) }
  let(:catalog_id) { catalogs.first.id }

  # Test suite for GET /catalogs
  describe 'GET /catalogs' do
    # make HTTP get request before each example
    before { get '/catalogs' }

    it 'returns catalogs' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /catalogs/:id
  describe 'GET /catalogs:id' do
    before { get "/catalogs/#{catalog_id}" }

    context 'when the record exists' do
      it 'returns the catalog' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(catalog_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      context 'when the record does not exists' do
        let(:catalog_id) { 1000 }

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Catalog/)
        end
      end
    end
  end

  # Test suite for POST /catalogs
  describe 'POST /catalogs' do
    # valid payload
    let(:valid_attributes) { { code: '123456', name: 'plopAndPouet' } }

    context 'when the request is valid' do
      before { post '/catalogs', params: valid_attributes }

      it 'creates an catalog' do
        expect(json['name']).to eq('plopAndPouet')
      end

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for PATCH /catalogs/:id
  describe 'PATCH /catalogs/:id' do
    let(:valid_attributes) { { name: 'New name' } }

    context 'when the record exists' do
      before { put "/catalogs/#{catalog_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /catalogs/:id' do
    before { delete "/catalogs/#{catalog_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
