# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :groups, only: %i[create new index destroy] do
    resources :transfers, only: %i[create new index destroy]
  end
  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
end
