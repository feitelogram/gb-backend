Rails.application.routes.draw do
  resources :appointments
  resources :saveds
  resources :providers
  resources :users

  post "login", to: "auth#login"
  get "persist", to: "auth#persist"
  post "test", to: "providers#test"
  post "watson", to: "watson#watson"
  post "watsonapi", to: "watson#api"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
