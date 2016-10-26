Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :categories, only: [:index, :new, :create, :destroy]

  resources :gifs, only: [:new, :create, :show, :index, :destroy]

  resources :favorites, only: [:new, :create, :destroy]

end
