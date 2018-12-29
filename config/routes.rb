Rails.application.routes.draw do
  root to: "home#index"
  post "/filter_currency", to: "home#filter_currency"
  get  "/filter_currency", to: "home#filter_currency"
  get  "/all", to: "home#all"
  resources :transactions
  resources :users
end
