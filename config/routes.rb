Rails.application.routes.draw do
  resources :info

  resources :pizzas

  root "pizzas#index"
end
