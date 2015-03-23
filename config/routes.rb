InitiativeApp::Application.routes.draw do

  resources :initiatives do
  	resources :users
  	resources :groups
    member do
      get 'add_myself'
    end
  end

  get '/search',       to: "search#index"
  get '/autocomplete', to: "search#autocomplete"
  get '/tags/:tag',     to: 'initiatives#index', as: :tag

  get '/auth/:provider/callback', to: 'sessions#create'

  root to: "initiatives#index"
end
