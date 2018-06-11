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
  namespace :calls do
    resources :history, only: [:index]
  end
  resources :calls, only: [:index, :show, :update]
  resources :conference, only: [:show, :create, :update, :destroy]
  resources :dashboard, only: [:index]
  resources :account, only: [:index]
  resources :profiles, only: %i[show index]
  resources :settings, only: [:index, :create]
  namespace :settings do
    resources :about, only: [:index, :create]
    resources :categories, only: [:index, :create]
    resources :wallet, only: [:index, :create, :destroy, :update]
  end

  namespace :requests do
    resources :times, only: [:edit, :update]
  end
  resources :messages, only: :create
  resources :requests do
    scope module: 'requests' do
      resources :verify, only: [:index, :create]
    end
  end
  resources :inbox, only: [:index, :show] do
    collection do
      get 'all'
    end
  end

  get 'requests/:id/thankyou', to: 'requests#thankyou', as: :requests_thankyou
  resources :reviews
  resources :my_mentors, path: 'my-mentors', only: [:index]
  resources :payments, only: [:index, :show] do
    get 'received', on: :collection
  end
  resources :callbacks, only: :create
end
