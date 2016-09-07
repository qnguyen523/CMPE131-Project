Rails.application.routes.draw do

  resources :posts
  root :to => 'welcome#index'
  
  resources :signups
  get 'welcome/index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
end
