Rails.application.routes.draw do
  resource :dashboard

  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }

  namespace :admin do
    resource :dashboard
    resources :settings
  end

  devise_for :admins
  resources :petrablog
  resources :persons
  post 'persons/:id' => 'persons#update'
  root 'home#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
