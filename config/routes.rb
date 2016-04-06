Rails.application.routes.draw do

  resources :users
  resources :tasks

  root 'tasks#index'
end
