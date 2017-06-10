Rails.application.routes.draw do

    devise_for :users

    root "users#index"

    resources :users, only: [:index, :show, :create, :edit, :new, :destroy] do
      resources :events, only: [:index, :show, :create, :edit, :update, :destroy]

    resources :searches, only: [:index]

    end
  end
