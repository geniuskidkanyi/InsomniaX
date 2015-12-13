Rails.application.routes.draw do

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  root 'pages#index'
  get 'help'  => 'pages#help'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
    resources :users do
        member do
            get :following, :followers
        end
    end
  resources :microposts do
    member do
      get "like", to: "microposts#upvote"
      get "dislike", to: "microposts#downvote"
    end
  end
  resources :post


  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end
