# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    devise_for :users, path: '', 
      path_names: { sign_in: 'login', 
                    sign_out: 'logout',
                    sign_up: 'signup' },
      controllers: { registrations: 'registrations', 
                    confirmations: 'confirmations', 
                    sessions: 'sessions' }

  resources :pages, only: [:show]
  root 'pages#mentors_home'
  resources :categories do
    get ':subcategory_id', to: 'subcategories#show', as: :subcategory
  end

  get 'calls(/history)', to: 'calls#index'
  resources :dashboard, only: [:index]
end
