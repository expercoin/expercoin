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

  # resources :pages, only: [:show]
  root 'pages#business_home'
  resources :categories do
    get ':subcategory_id', to: 'subcategories#show', as: :subcategory
  end

  get 'for-mentors', to: 'pages#mentors_home'
  get 'calls(/history)', to: 'calls#index', as: :calls
  resources :calls, only: [:show, :update]
  resources :conference
  resources :dashboard, only: [:index]
  resources :account, only: [:index]
  resources :profiles, only: %i[show]
  resources :settings, only: [:index, :create]
  namespace :settings do
    resources :about, only: [:index, :create]
    resources :categories, only: [:index, :create]
  end

  resources :requests
  get 'requests/:id/thankyou', to: 'requests#thankyou', as: :requests_thankyou
  resources :reviews
  resources :my_mentors, path: 'my-mentors', only: [:index]

  #always last route
  resources :profiles, path: '', as: :expert, only: :show do
    resources :precall, only: :index
  end
end
