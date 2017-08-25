Rails.application.routes.draw do
  get 'articles/index'

  get 'articles/show'

  get 'articles/new'

  post 'articles/create'

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
  end
  resources :users, only: [:index, :show]
end
