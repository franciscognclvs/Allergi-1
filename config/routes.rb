Rails.application.routes.draw do
  get 'allergies/index'
  get 'allergies/show'
  get 'allergies/create'
  get 'allergies/destroy'
  get 'compound_mixes/create'
  get 'medicines/index'
  get 'medicines/emergency'
  get 'medicines/show'
  get 'medicines/create'
  get 'medicines/destroy'
  get 'medicines/search_medicine'
  get 'substances/index'
  get 'substances/show'
  get 'substances/create'
  get 'substances/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :allergies
  resources :compound_mixes
  resources :medicines
  resources :substances
end
