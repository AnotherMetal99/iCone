Rails.application.routes.draw do

  get 'comments/create'
  get "/dashboard" => "users#index", as: :dashboard
  get "profile/:username" => "users#profile", as: :profile
  get "posts/index" => "posts#index", as: :top
  get "relationships/user_follower" => "relationships#user_follower", as: :followers
  get "relationships/user_following" => "relationships#user_following", as: :following


  devise_for :users
  resource :relationships, only:[:create,:destroy]
   resources :posts do
     resources :users do
     member do
       get :following, :followers
     end
      end
     resources :likes
     resources :comments
end
  root to: 'page#home', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
