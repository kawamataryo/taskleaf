Rails.application.routes.draw do
  namespace :admin do
    resource :users
  end
  resources :tasks
  root to: 'tasks#index'
end
