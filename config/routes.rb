Rails.application.routes.draw do
  get 'users/new'
  resources :users
  resources :sessions, only: [:new, :create,:destroy]
  get 'sessions/new'
    resources :galleries, only: [:index, :new, :create, :destroy, :show]
    root "galleries#index"
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
end
