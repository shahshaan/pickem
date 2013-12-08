Pickem::Application.routes.draw do

  get "/picks/:matchup_id/:team_id" => 'picks#create', as: 'create_pick'
  get 'matchups/admin' => 'matchups#admin'

  resources :matchups
  

  devise_for :users
  get "users" => 'users#index'
  get "users/:id" => 'users#show', as: 'user'

  root :to => "matchups#index"
end
