Rails.application.routes.draw do
  # root 'users#index'

  # resources :users, only: [:show, :index]
  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index]
  end

  # get '/users', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
