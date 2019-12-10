# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config


  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :meals, only: :index
    end
  end
end
