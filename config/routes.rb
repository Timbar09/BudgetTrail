Rails.application.routes.draw do
  devise_for :users
  root "splash#index"
end
