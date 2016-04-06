Rails.application.routes.draw do

  get '/sign_in', to: 'sessions#sign_in', as: 'sign_in'
  post '/sign_in', to: 'sessions#create'

  delete '/sign_out', to: 'sessions#sign_out', as: 'sign_out'

  resources :users
  resources :tasks

  root 'tasks#index'
end
