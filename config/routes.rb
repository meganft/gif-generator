Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

end
