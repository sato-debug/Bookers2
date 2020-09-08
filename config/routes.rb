Rails.application.routes.draw do
  root "homes#index"
  get "home/about" => "homes#about"
  devise_for :users


  resources :users, only: [:show, :edit, :update, :index] do
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :relationships, only: [:create, :destroy, ]
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
