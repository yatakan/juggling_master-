Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'records#index'
  get '/comments' => 'comments#index'

  resources :tricks do
    collection do
      get 'records'
    end
  end
  resources :records do
    resources :comments, only: [:new,:create]
    collection do
      get 'about'
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
