Rails.application.routes.draw do

  devise_for :users
  resources :posts, :lessons

  get '/users/:id', to: 'users#show'

  root 'main#index'
end
