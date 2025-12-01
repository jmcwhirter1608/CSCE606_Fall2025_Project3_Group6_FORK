Rails.application.routes.draw do
  root "home#index"

  devise_for :users,
    controllers: { registrations: "users/registrations" }

  # User profile
  get "/profile", to: "users#show"
  get "/settings/profile", to: "users#edit"
  patch "/settings/profile", to: "users#update"
  get "/u/:username", to: "users#public_profile", as: :public_profile

  get "up" => "rails/health#show", as: :rails_health_check

  resources :movies, only: [ :index, :show ] do
    resources :reviews, only: [ :create, :edit, :update, :destroy ]
    collection do
      get "search"
    end
  end

  resources :reviews, only: [] do
    member do
      post :vote
      post :report
    end
  end

  # ==================================================
  # SOCIAL & COMMUNITY ROUTES
  # ==================================================
  resources :users, only: [:show] do
    resource :follow, only: [:create, :destroy], controller: 'follows'
  end

  resources :lists do
    resources :list_items, only: [:create, :destroy]
  end
  # ==================================================

  get "my_reviews", to: "reviews#my_reviews", as: :my_reviews
end