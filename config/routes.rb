Rails.application.routes.draw do
  resources :hearts
  mount ActionCable.server => '/cable'
  mount Ckeditor::Engine => '/ckeditor'
  resources :chatgroups, path: '/chatrooms/' do
    resource :chatgroup_users
    resources :messages
  end

  resources :direct_messages
  authenticated :user do
  #  get '/home', to: 'pages#home', as: :authenticated_root
   root 'pages#home', as: :authenticated_root

  end
  root 'pages#index'

  devise_for :users, skip: [:sessions]
  as :user do
      get 'login' => 'devise/sessions#new', :as => :new_user_session
      post 'login' => 'devise/sessions#create', :as => :user_session
      match 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session,
            :via => Devise.mappings[:user].sign_out_via
  end


  get 'help'  => 'pages#help'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'search' => 'search#index'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
    resources :users do
        member do
            get :following, :followers, :about
        end
    end
    put '/comments/:id/:action' => 'comments#upvote'
    put '/comments/:id/:action' => 'comments#downvote'
    resources :articles do
        resources :comments do

      end
   end
   resources :microposts do
     member do
       get "heart", to: "microposts#heart", via: :post
       delete "unheart", to: "microposts#unheart"
     end
 end


  resources :microposts, only: [:create, :destroy]
 resources :relationships, only: [:create, :destroy]

  # resources :comments
  resources :tags, only: [:index, :show]
  resources :forum_threads, path: '/forums/'  do
    resources :forum_posts, module: :forum_threads

  end
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end


end
