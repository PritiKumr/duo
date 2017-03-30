Rails.application.routes.draw do

  devise_for :users
  resources :entries, only: [:index, :update]
  get '/:date', to: 'entries#index'
  root to: 'entries#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
