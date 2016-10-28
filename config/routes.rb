Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :categories, only: [:index]

  resources :gifs, only: [:show, :index, :create, :new]
  #took out new, create and destroy
  resources :favorites, only: [:new, :create, :destroy]

  namespace :admin do
    resources :gifs, only: [:new, :index, :create, :destroy]
    resources :categories, only: [:index, :new, :create, :destroy]
    resources :users, only: [:new, :index, :create, :destroy, :show]
    resources :favorites, only: [:new, :create, :destroy]
  end

root 'sessions#new'

end
