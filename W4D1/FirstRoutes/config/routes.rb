Rails.application.routes.draw do
  # get 'users' => 'users#index'
  # get 'users/:id' => 'users#show', :as => 'user'
  # get 'users/new' => 'users#new', :as => 'new_user'
  # get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  # post 'users' => 'users#create'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
  
  resources :users
end
