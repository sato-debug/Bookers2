Rails.application.routes.draw do

  root "homes#index"
  get "home/about" => "homes#about"
  devise_for :users

  resources :books, only: [:edit, :create, :index, :show, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
