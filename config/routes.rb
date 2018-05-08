# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :pages, only: [:show]
  root 'pages#mentors_home'
  resources :categories do
    get ':subcategory_id', to: 'subcategories#show', as: :subcategory
  end
end
