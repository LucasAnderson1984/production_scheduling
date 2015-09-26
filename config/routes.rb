Rails.application.routes.draw do
  devise_for :users
  resources :production_schedules
  root 'production_schedules#index'
end
