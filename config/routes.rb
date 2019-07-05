# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :definitions
    resources :definition_votes
    resources :definition_vote_ups
    resources :definition_vote_downs
    resources :definition_tags
    resources :tags

    root to: "users#index"
  end
  devise_for :users,
             path: "auth",
             path_names: { sign_up: "signup", sign_in: "login", sign_out: "logout" },
             controllers: { sessions: "users/sessions",
                            passwords: "users/passwords",
                            registrations: "users/registrations",
                            confirmations: "users/confirmations" }

  namespace :v1 do
    # TODO: make API endpoints for future mobile development
  end

  resource :user, only: :show
  resources :words, only: :index
  resources :definitions, only: %i[index new create edit update destroy] do
    resources :votes, only: :create, module: :definitions
  end
  resources :tags, only: %i[index show]

  root to: "words#index"
end
