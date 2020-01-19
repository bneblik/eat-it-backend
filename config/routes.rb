# frozen_string_literal: true

Rails.application.routes.draw do
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
      resources :meals
    end
  end
end
