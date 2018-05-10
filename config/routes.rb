Rails.application.routes.draw do
    resources :galleries, only: [:index, :new, :create, :destroy, :show]
    root "galleries#index"
    
end
