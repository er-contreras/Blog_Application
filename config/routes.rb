Rails.application.routes.draw do
  root 'users#index'
  
  # resources :users, only: [:show, :index]
  resources :users, only: [:show, :index] do
    resources :posts, only: [:show, :index]
    # resources :posts, only: [:new, :create]
  end
  
  # resources :post, only: [:new, :create]
  get 'new_post/new', to: 'new_post#new', as: 'new_post' # new
  # get "/users/#{@user.id}/new", to: ''
  # get '/users', to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
