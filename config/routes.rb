Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users
  resources :tweets do
    member do
      post "favorite"
    end
  end


  get "/auth/twitter", as: :login
  get "/auth/twitter/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
