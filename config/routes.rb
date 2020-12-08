Rails.application.routes.draw do  
  root to: 'pages#home'
  get 'pages/user_page'
  # get 'allergies/index'
  # get 'allergies/show'
  # get 'allergies/create'
  # get 'allergies/destroy'
  # get 'compound_mixes/create'
  # get 'medicines/index'
  get 'medicines/emergency'
  # get 'medicines/show'
  # get 'medicines/create'
  # get 'medicines/destroy'
  get 'medicines/search_medicine'
  get 'appointments/search'
  # get 'substances/index'
  # get 'substances/show'
  # get 'substances/create'
  # get 'substances/destroy'
  # get '/medicines/:medicine_id/allergies/new', to: 'allergies#new', as: 'allergy'
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
    resources :allergies
  end
  resources :substances
  resources :appointments
  resources :allergies_reactions
  resources :users, only: :index
end
