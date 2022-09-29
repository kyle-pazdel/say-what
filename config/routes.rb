Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :conversations do
    resources :messages
  end

  # Defines the root path route ("/")
  root "conversations#index"

  # User Routes
  resources :users

  # Sessions Routes
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

end
