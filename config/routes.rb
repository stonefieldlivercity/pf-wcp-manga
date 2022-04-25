Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'users', to: 'devise/registrations#new'
  end

  root to: "homes#top"
  get "/homes/about" => "homes#about", as: "about"
#言語設定
  get "/homes/language/:lang" => "homes#language"
  get "/users/mypage/:id" => "users#show", as: "mypage"
  resources :users, only: [:show, :edit, :update]
  resources :genres, only: [:index, :show, :new, :create, :destroy]
  get 'search' => 'books#search'
  get 'result' => 'books#result'
  resources :books, only: [:new, :create, :show, :index, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :ratings, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
