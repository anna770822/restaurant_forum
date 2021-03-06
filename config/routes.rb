Rails.application.routes.draw do
  devise_for :users

  resources :users, only:[:index, :show, :edit, :update]

  resources :followships, only:[:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
      get :ranking
    end

    member do 
      get :dashboard
      post :favorite
      post :unfavorite

      post :like
      post :unlike
    end
    
  end

  resources :categories, only: [:show]
  
  namespace :admin do 
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
