Rails.application.routes.draw do
  resources :stores
  resources :categories
  resources :products
  resources :suppliers
  resources :vendors

  root 'stores#index'

end
