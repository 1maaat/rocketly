Rails.application.routes.draw do
  get 'users/show'
  get 'artworks/index'
  get 'artworks/show'
  get 'artworks/create'
  get 'artworks/new'
  get 'challenges/index'
  get 'challenges/show'
  get 'challenges/create'
  get 'challenges/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
