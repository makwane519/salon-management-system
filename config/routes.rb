Rails.application.routes.draw do
  root "dashboard#index"

  resources :services
  resources :customers
  resources :staffs
  resources :appointments
end
