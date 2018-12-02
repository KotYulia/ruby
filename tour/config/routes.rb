Rails.application.routes.draw do
  resources :countries do
    resources :cities do
      resources :airports
    end
  end

  root 'countries#index'
end
