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
  get '/users/:id', to: 'users#show', as: :user

  #  Action to mark teacher's note to student as read
  put '/lessons/notes/:id', to: 'lessons#mark_note_as_read', as: :mark_as_read
  # Action to dismiss notifications
  put '/notifications/:id', to: 'lessons#dismiss_notification', as: :dismiss_notice

end
