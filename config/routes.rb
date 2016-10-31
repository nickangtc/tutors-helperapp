Rails.application.routes.draw do

  devise_for :users

  resources :lessons
  resources :posts do
    resources :comments
  end

  get '/users/:id', to: 'users#show'
  root 'main#index'
end
