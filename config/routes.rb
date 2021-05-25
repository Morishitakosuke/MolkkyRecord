Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
  }
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  resources :follow_relationships, only: [:create, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :notifications, only: [:index, :destroy]
  resources :tags do
    get 'posts' => 'posts#tags'
  end
  post '/posts/:post_id/likes' => "likes#create"
  delete '/posts/:post_id/likes' => "likes#destroy"
end
