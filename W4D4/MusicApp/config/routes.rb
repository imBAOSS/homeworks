Rails.application.routes.draw do
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, except: [:new] do
    resources :tracks, only: [:new]
  end

  resources :tracks, except: [:new]
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:new, :create, :destroy]
end
