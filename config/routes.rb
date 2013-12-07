Pickem::Application.routes.draw do
  resources :matchups
  devise_for :users
  
  root :to => "home#index"
end
