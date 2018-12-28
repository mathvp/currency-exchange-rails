Rails.application.routes.draw do
  root to: "home#index"
  post "/", to: "home#index"
  resources :transactions
  resources :users
end
