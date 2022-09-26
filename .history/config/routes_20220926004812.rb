Rails.application.routes.draw do
  get '/member_details' => 'members#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

end
