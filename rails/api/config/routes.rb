# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  
  # Versioning the whole API, starts with V1
  scope 'v1' do

    # Articles
    resources :articles
    resources :catalogs do
      resources :article_publications
      resources :articles, only: [:index, :show]
    end

  end

end
