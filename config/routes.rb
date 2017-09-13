Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only:[:new, :create, :show]

  resources :users do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:index, :new, :create, :destroy]
  end

  namespace :admin do
    resources :images, only: [:index, :new, :create, :destroy]
  end

  resources :ideas do
    resources :idea_images, only: [:new, :create]
  end


  get '/login', :to => "sessions#new", :as => 'login'

  post '/login', :to => "sessions#create"

  delete '/logout', :to => "sessions#destroy", :as => 'logout'
end
