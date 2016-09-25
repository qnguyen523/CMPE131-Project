Rails.application.routes.draw do
  get 'static_pages/help'

  get 'static_pages/about'

  resources :ads
  devise_for :users
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
