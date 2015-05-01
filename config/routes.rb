Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations' }

  resources :perks, only: [:index, :show, :update]
  resources :businesses, only: [:index, :show]

end