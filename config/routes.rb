Rails.application.routes.draw do
  get 'businesses/index'

  get 'businesses/show'

  get 'businesses/create'

  get 'businesses/new'

  get 'businesses/edit'

  get 'businesses/update'

  get 'businesses/destroy'

  get 'perks/index'

  get 'perks/show'

  get 'perks/create'

  get 'perks/new'

  get 'perks/edit'

  get 'perks/update'

  get 'perks/destroy'

  devise_for :users

  resources :perks, only: [:index, :show]
end
