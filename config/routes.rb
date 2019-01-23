Rails.application.routes.draw do

  # get 'users/show'

  devise_for :users

  resources :users, only: [:show, :edit, :update, :index]
  resources :books

# root 'books#index'
  root 'books#home'
  get '/about' => 'books#about'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html