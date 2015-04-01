Rails.application.routes.draw do
  devise_for :users
  resources :mention
  root to: 'main#home'
  namespace :api do
    resources :candidates
    resources :users
  end
end
