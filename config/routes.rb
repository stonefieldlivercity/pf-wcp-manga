Rails.application.routes.draw do
  devise_for :users

  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
  get "/users/mypage/:id" => "users#show", as: "mypage"
  resources :users
  resources :genres, oniy: [:index, :show]
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  resource :ratings, only: [:create]
  
  #resouce :ratings, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
