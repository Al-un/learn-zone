# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  root to: 'welcome#index'

  # Auth0
  get 'auth/oauth2/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'auth/logout' => 'logout#logout'
  post '/register' => 'welcome#register'

  # Articles
  resources :articles
  resources :catalogs do
    resources :article_publications
    resources :articles, only: [:index, :show]
  end

end
