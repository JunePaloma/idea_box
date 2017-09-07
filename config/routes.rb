Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only:[:new, :create, :show]

  get '/dashboard', :to => 'dashboard#dashboard', :as => 'dashboard'




end
