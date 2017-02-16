Rails.application.routes.draw do
  resources :tracks, except: [:index]
  resources :albums, except: [:index]
  resources :bands
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:new, :create, :destroy]
end
