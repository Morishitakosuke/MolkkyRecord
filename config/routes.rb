Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :notifications, only: [:index, :destroy]
  resources :tags do
    get 'posts' => 'posts#tags'
    post 'posts' => 'posts#tags'
  end
  post '/posts/:post_id/likes' => 'likes#create'
  delete '/posts/:post_id/likes' => 'likes#destroy'
  get '/search', to: 'posts#search'
  resources :records
end
