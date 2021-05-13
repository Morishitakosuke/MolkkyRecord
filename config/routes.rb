Rails.application.routes.draw do
  root 'static_pages#home'
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
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
