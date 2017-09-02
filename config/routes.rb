Rails.application.routes.draw do
  resources :petrablog
  resources :persons
  post 'persons/:id' => 'persons#update'
  root 'home#index'
end
