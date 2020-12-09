Rails.application.routes.draw do  
  root to: 'pages#home'
  get 'pages/user_page'
  get 'medicines/:id/emergency', to: 'medicines#emergency', as: 'emergency'
  get 'medicines/search_medicine'
  get 'appointments/search'
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
  resources :compound_mixes
  resources :medicines do
    resources :allergies, only: :create
  end
  resources :allergies, only: :show do
    resources :allergies_reactions, only: :create
  end
  resources :allergies, only: :index
  resources :substances
  resources :appointments
  resources :allergies_reactions
  resources :users, only: [:index, :show]
  resources :active_problems, only: [:create, :destroy]
end
