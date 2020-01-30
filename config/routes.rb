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
      get '/meals/recommended_meals', to: 'meals#recommended_meals'
      resources :meals, only: [:create, :destroy, :update, :index, :show]
      resources :products, only: [:index, :show]
      resources :meal_plans, only: [:create, :destroy, :update, :index]
      get '/meal_plans/meal_eaten', to: 'meal_plans#meal_eaten'
      get '/meal_plans/day_statistic', to: 'meal_plans#day_statistic'
      resources :fridges, only: [:index, :create, :update]
      resources :users, only: [:update, :show, :destroy]
      resources :comments, only: [:index, :create, :update, :destroy]
      resources :shopping_lists, only: [:index, :create, :update]
      resources :meal_categories, only: [:index]
    end
  end
end
