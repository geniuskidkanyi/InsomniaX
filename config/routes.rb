Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :chatgroups do
    resource :chatgroup_users
    resources :messages
  end
  get 'forumthred/index'

  get 'forumthred/show'

  get 'forumthred/edit'

  resources :forums
  root 'pages#index'
  get 'password_resets/new'

  get 'password_resets/edit'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, skip: [:sessions]
  as :user do
      get 'login' => 'devise/sessions#new', :as => :new_user_session
      post 'login' => 'devise/sessions#create', :as => :user_session
      match 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session,
            :via => Devise.mappings[:user].sign_out_via
  end


  get 'help'  => 'pages#help'
  get 'about' => 'pages#about'
#  get 'leaderboard' => 'pages#leaderboard'
  get 'contact' => 'pages#contact'
  # get 'signup' => 'users#new'
  # get 'login' => 'sessions#new'
  # post 'login' => 'sessions#create'
  # get 'sign_in' => 'sessions#new'
  # post 'sign_in' => 'sessions#create'
  # delete 'logout' => 'sessions#destroy'
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
      get "like", to: "microposts#upvote"
get "dislike", to: "microposts#downvote"
    end
 end


 resources :microposts, only: [:create, :destroy]
 resources :relationships, only: [:create, :destroy]

  resources :comments
  resources :tags, only: [:index, :show]
  resources :forum_threads do
    resources :forum_posts, module: :forum_threads

  end
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end



end
