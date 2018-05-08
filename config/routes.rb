# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages, only: [:show]
  root 'pages#index'
end
