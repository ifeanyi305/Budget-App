# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'groups#index'
  resources :users, only: %i[index show]
  resources :groups, only: %i[create new index destroy] do
    resources :transfers, only: %i[create new index destroy]
  end
end
