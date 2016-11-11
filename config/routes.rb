Rails.application.routes.draw do
  get 'info/index'

  get 'info/index'

  resources :pizzas

  root "pizzas#index"
end
