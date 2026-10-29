Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "dashboard#index"

  resources :services
  resources :customers
  resources :staffs
  resources :appointments
end
