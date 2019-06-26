# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1 do
    # TODO: make API endpoints for future mobile development
  end

  resource :user, only: :show
  resources :words, only: [:index]
  resources :definitions, only: %i[index new create edit update destroy]
  resources :tags

  root to: "words#index"
end
