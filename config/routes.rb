Rails.application.routes.draw do

  # Use Devise's default controllers
  # but use customised Registrations controller
  devise_for :users, controllers: { registrations: "users/registrations" }


  resources :lessons

  resources :posts do
    resources :comments
  end

  # Landing page
  root 'main#index'

  # Frontpage if logged in
  get '/users/:id', to: 'users#show'

  put '/lesson/update/:id', to: 'lessons#mark_note_as_read', as: :lesson_update

end
