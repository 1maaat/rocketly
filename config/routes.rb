Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :challenges, only: [:index, :show, :create, :new] do
    resources :artworks, only: [:index, :show, :new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
