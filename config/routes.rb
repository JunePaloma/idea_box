Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only:[:new, :create, :show]

  resources :users do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:index, :new, :create]
  end


  get '/login', :to => "sessions#new", :as => 'login'

  post '/login', :to => "sessions#create"

  delete '/logout', :to => "sessions#destroy", :as => 'logout'
end
