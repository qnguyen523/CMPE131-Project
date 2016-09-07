Rails.application.routes.draw do
  resources :posts
  resources :users
  get 'static_pages/home'
  get 'static_pages/help'

  root 'static_pages#home'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
