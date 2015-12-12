Rails.application.routes.draw do
  root 'pages#index'
  get 'help'  => 'pages#help'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
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

  resources :users
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

end
