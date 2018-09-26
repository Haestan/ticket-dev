Rails.application.routes.draw do

  get 'status/resolved'
  resources :categories

  resources :tickets do
    resources :comments
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tickets#index'

end
