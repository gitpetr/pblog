Rails.application.routes.draw do
  resource :dashboard

  devise_for :users
  namespace :admin do
    resource :dashboard
    # get 'dashboards/show'
  end

  devise_for :admins
  resources :petrablog
  resources :persons
  post 'persons/:id' => 'persons#update'
  root 'home#index'

end
