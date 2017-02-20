# Rails.application.routes.draw do
#   resources :users
#   resources :subs
#   resources :posts
#   resource :session
# end


Rails.application.routes.draw do
  resources :users do
    resources :posts, only: [:edit, :update]
  end

  resources :subs

  resources :posts, except: [:edit, :update] do
    resources :comments, only: [:new, :create]
  end

  resources :comments, except: [:new]
  resource :session
end
