Rails.application.routes.draw do

    devise_for :users

    root "users#index"

    resources :users, only: [:index, :show, :create, :edit, :new, :destroy]

    resources :searches, only: [:index]

    resources :events, only: [:index, :show, :create, :edit, :update, :destroy] do
      resources :users, only: [:index, :show, ]
    end
  end
