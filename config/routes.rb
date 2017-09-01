Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'records#index'
  get '/comments' => 'comments#index'

  ##いいね
  post '/article_like/:article_id' => 'articles_likes#like', as: 'article_like'
  delete '/article_like/:article_id' => 'articles_likes#unlike', as: 'article_unlike'
  get '/auth/failure',               to: 'users#auth_failure', as: :auth_failure

  ##Facebook
  get '/auth/:provider/callback',    to: 'users#create',       as: :auth_callback

  resources :tricks do
    collection do
      get 'records'
    end
  end
  resources :records do
    resources :comments, only: [:new,:create]
    collection do
      get 'about'
      get 'records'
    end
  end
  resources :users, only: [:index, :show] do
    member do
      get :following, :followers
    end
  end
  resources :articles do
    resources :article_comments
  end
  resources :relationships, only: [:create, :destroy]
end
