Rails.application.routes.draw do
  resources :production_items
  resources :production_formulas
  devise_for :users
  resources :production_schedules
  root 'production_schedules#index'
end
