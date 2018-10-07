# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  # Articles
  resources :articles
  resources :catalogs do
    resources :article_publications
    resources :articles, only: [:index, :show]
  end

end
