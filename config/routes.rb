Rails.application.routes.draw do
  devise_for :users

  root "splash#index"

  resources :categories, only: %i[index] do
    resources :expenses, only: %i[index]
  end
end
