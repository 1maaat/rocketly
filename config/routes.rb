Rails.application.routes.draw do
  resources :challenges, only: [:index, :show, :create, :new] do
    resources :artworks, only: [:new, :create]
  end
  get 'users/show'
  get 'artworks/index'
  get 'artworks/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
