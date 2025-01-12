Rails.application.routes.draw do
  root "lists#index"

  resources :lists do
    resources :tasks, only: [:create, :destroy]
  end
end
