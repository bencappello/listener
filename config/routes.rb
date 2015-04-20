Rails.application.routes.draw do
  root to: 'static_pages#root'



  namespace :api, defaults: { format: :json } do
    resources :users

    post "session/guest", to: 'sessions#guest_sign_in'
    post "users/create_new", to: 'users#create_new'
    resource :session, only: [:show, :update, :create, :destroy]
    resources :bands do
      resources :songs, only: [:new]
    end
    resources :blogs do
      resources :songs, only: [:new]
    end
    resources :songs
    resources :tags, except: [:show]
    resources :comments, only: [:create, :destroy, :update]
    resources :user_follows, only: [:create, :destroy]
    resources :user_songs, only: [:create, :destroy]
    resources :user_blogs, only: [:create, :destroy]
  end

  resources :bands do
    resources :songs, only: [:new]
  end
  resources :blogs do
    resources :songs, only: [:new]
  end
  resources :songs
  resources :tags, except: [:show]
  resources :comments, only: [:create, :destroy, :update]
  resources :user_follows, only: [:create, :destroy]
  resources :user_songs, only: [:create, :destroy]
  resources :user_blogs, only: [:create, :destroy]

end
