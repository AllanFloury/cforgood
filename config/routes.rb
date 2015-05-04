Rails.application.routes.draw do
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"
  get "partner", to: "pages#partner"
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations' }

  resources :perks, only: [:index, :show, :update]
  resources :businesses, only: [:index, :show, :new, :create]
end