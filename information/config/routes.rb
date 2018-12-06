Rails.application.routes.draw do
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :users
  resources :sessions , except: [:edit, :update]
  resources :tasks

  root 'sessions#new'
end
