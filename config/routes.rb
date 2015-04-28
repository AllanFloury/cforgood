Rails.application.routes.draw do
  devise_for :users

  resources :perks, only: [:index, :show]
end
