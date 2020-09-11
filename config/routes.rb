Rails.application.routes.draw do
  devise_for :users
  root 'top#top'
  get 'user_top/:id' => 'top#user_top', as: "user_top"
  get 'search/search' => 'search#search'

  resources :users, only: [:show, :update] do
    member do
      get :withdraw
      patch :unsubscribe
    end
  end

  resource :genres, only: [:new, :create, :update] do
    resources :materials, only: [:create, :index, :update, :destroy] do
      collection do
        get :search
      end
      resources :eats, only: [:create, :destroy]
    end
  end

  resources :recipe, except: [:edit] do
    resource :favorites, only: [:create, :destroy]
    resource :reviews, only: [:create, :destroy]
    resource :recipe_materials, only: [:create, :destroy]
  end

  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
