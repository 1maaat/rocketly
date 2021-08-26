Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :challenges do
    member do
      post 'selected'
    end
    resources :artworks, only: [:index, :show, :new, :create]
  end

  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
