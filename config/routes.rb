Rails.application.routes.draw do
  devise_for :users

  root "splash#index"

  resources :categories, only: %i[index new create] do
    resources :expenses, only: %i[index]
  end
end
