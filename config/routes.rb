# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'comments/Property'
    end
  end
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_scope :user do
    scope :api do
      scope :v1 do
        resources :registrations,
                  only: [:create, :destroy],
                  path: 'users/registrations',
                  controller: 'registrations'
        resources :sessions,
                  only: [:create],
                  path: 'users/sessions',
                  controller: 'sessions'
        delete 'users/logout', to: 'sessions#destroy'
      end
    end
  end

  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :meals, only: [:create, :destroy, :update, :index, :show]
      resources :products
      resources :fridges
      resources :comments
      resources :shopping_lists
      resources :meal_categories
    end
  end
end
