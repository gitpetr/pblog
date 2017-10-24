Rails.application.routes.draw do
  use_doorkeeper
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts, only: [:index, :show]

  namespace 'api' do
    namespace 'v1' do
      resources :posts, only: [:index, :show]
    end
  end
  
  resource :dashboard
  resources :tags, only: [:show]

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
    resources :tags, only: [:show]
  end

  devise_for :admins, controllers: {
    registrations: 'admins/registrations'
  }

  # resources :petrablog
  root 'home#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
