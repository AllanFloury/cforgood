Rails.application.routes.draw do
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
