Rails.application.routes.draw do
  
  resources :jobs
  resources :staffs
  resources :deployment_orders
  resources :rigs
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "deployment_orders#index" 
end
