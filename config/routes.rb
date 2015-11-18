Rails.application.routes.draw do
  resources   :production_items
  resources   :production_formulas
  devise_for  :users
  resources   :production_schedules
  resources   :weeks_supply_calcs
  root 'production_schedules#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
