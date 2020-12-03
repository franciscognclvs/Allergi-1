Rails.application.routes.draw do  
  root to: 'pages#home'
  devise_for :users, path: 'users', controllers: { 
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations",
   }
  devise_for :doctors, path: 'doctors', controllers: { 
    sessions:           "doctors/sessions",
    passwords:          "doctors/passwords",
    registrations:      "doctors/registrations",
    confirmations:      "doctors/confirmations",
   }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :allergies
  resources :compound_mixes
  resources :medicines
  resources :substances
  
end
