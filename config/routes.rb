Rails.application.routes.draw do
  get 'users/show'
  get 'artworks/index'
  get 'artworks/show'
  get 'artworks/create'
  get 'artworks/new'

  resources :challenges, only: [:index, :show, :create, :new] do
    resources :artworks, only: [:index, :show]
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
