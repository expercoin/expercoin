# frozen_string_literal: true

Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    devise_for :users, path: '', 
      path_names: { sign_in: 'login', 
                    sign_out: 'logout',
                    sign_up: 'signup' },
      controllers: { registrations: 'registrations', 
                    sessions: 'sessions' }

  # resources :pages, only: [:show]
  root 'pages#business_home'
  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'
  resources :categories do
    get ':subcategory_id', to: 'subcategories#show', as: :subcategory
  end 
  get 'for-mentors', to: 'pages#mentors_home'
  namespace :calls do
    resources :history, only: [:index]
  end
  resources :calls, only: [:index, :show, :update] do
    get :reject, on: :member
  end
  resources :conference, only: [:show, :create, :update, :destroy]
  resources :dashboard, only: [:index]
  resources :account, only: [:index]
  resources :profiles, only: %i[show index]
  resources :settings, only: [:index, :create] do
    get :states, on: :collection
    get :cities, on: :collection
  end
  namespace :settings do
    resources :about, only: [:index, :create]
    resources :video, only: [:index, :create]
    resources :authenticate, only: [:index]
    resources :services, path: 'offerings', only: [:index]
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
  resources :services, path: 'offerings'
  resources :wishlist, only: :index
  post 'wishlist/:service_id', to: 'wishlist#create', as: :wishlist_create
end
