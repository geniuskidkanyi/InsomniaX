Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  mount Ckeditor::Engine => '/ckeditor'
  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'
    mount Soulmate::Server, :at => "/searchs"

  root 'pages#index'
  get 'help'  => 'pages#help'
  get 'about' => 'pages#about'
  get 'leaderboard' => 'pages#leaderboard'
  get 'contact' => 'pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
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
    resources :conversations, only: [:index, :show, :destroy] do
        member do
            post :reply
            post :restore
            post :mark_as_read
        end
        collection do
            delete :empty_trash
        end
    end
  resources :messages, only: [:new, :create]

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

    resources :comments
    resources :tags, only: [:index, :show]

    resources :forums, :only => [:index, :show], :path => "/" do
    resources :topics, :except => :index do
      resources :posts, :except => :index
      member do
        post :subscribe
        post :unsubscribe
      end
    end
  end
end
