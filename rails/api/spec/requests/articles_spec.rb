# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Article API', type: :request do
  # initialise test data
  let!(:articles) { create_list(:article, 10) }
  let(:article_id) { articles.first.id }

  # Test suite for GET /articles
  describe 'GET /articles' do
    # make HTTP get request before each example
    before { get '/articles' }

    it 'returns articles' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /articles/:id
  describe 'GET /articles:id' do
    before { get "/articles/#{article_id}" }

    context 'when the record exists' do
      it 'returns the article' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(article_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      context 'when the record does not exists' do
        let(:article_id) { 1000 }

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Article/)
        end
      end
    end
  end

  # Test suite for POST /articles
  describe 'POST /articles' do
    # valid payload
    let(:valid_attributes) { { name: 'plopAndPouet' } }

    context 'when the request is valid' do
      before { post '/articles', params: valid_attributes }

      it 'creates an article' do
        expect(json['name']).to eq('plopAndPouet')
      end

      it 'return status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for PATCH /articles/:id
  describe 'PATCH /articles/:id' do
    let(:valid_attributes) { { name: 'New name' } }

    context 'when the record exists' do
      before { put "/articles/#{article_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /articles/:id' do
    before { delete "/articles/#{article_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
