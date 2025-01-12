Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "lists#index"

  resources :lists do
    resources :tasks, only: [:create, :destroy] 
  end
end
