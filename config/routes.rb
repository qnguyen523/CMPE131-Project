Rails.application.routes.draw do
  get 'sessions/new'

  resources :posts
  resources :users

  get 'static_pages/home'
  get 'static_pages/help'
  get 'help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/users', to: 'users#index'
  get '/post', to: 'posts#index'


  root 'static_pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
