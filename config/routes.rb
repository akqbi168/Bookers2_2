Rails.application.routes.draw do

  # get 'users/show'

  devise_for :users
  # root 'books#index'
  root 'books#home'
  get '/about' => 'books#about'

  resources :books, only: [:new, :create, :index, :show, :destroy] do
  end

  resources :users, only: [:show, :edit, :update]

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html