Rails.application.routes.draw do

  resources :users
  resources :subs
  resources :posts, except: [:index]
  resource :session

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
