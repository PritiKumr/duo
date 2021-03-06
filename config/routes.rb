Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "users/registrations" }
  resources :entries, only: [:index, :update]
  get '/:date', to: 'entries#index'
  get '/user/detail' => 'entries#user_detail'
  root to: 'entries#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
