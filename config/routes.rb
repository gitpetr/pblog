Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts, only: [:index, :show]
  resource :dashboard

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :posts do
      member do
        put 'public_post', to: 'public_on#public_post'
        put 'public_off_post', to: 'public_on#public_off_post'
      end
    end
    resource :dashboard
    resources :settings
  end

  devise_for :admins, controllers: {
    registrations: 'admins/registrations'
  }

  resources :petrablog
  root 'home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
