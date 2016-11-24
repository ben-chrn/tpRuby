Rails.application.routes.draw do
  
  resources :posts

  get 'users' => 'users#index'

  post 'users/new' => 'users#create'

  get 'users/export' => 'users#export'

  root 'pages#home'

  get 'pages/about' => 'pages#about'

  get 'pages/random/(:times)' => 'pages#random'
end
