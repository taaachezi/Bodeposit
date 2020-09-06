Rails.application.routes.draw do
  devise_for :users
  root 'top#top'
  get 'top/about' => 'top#about'
  get 'search/search' => 'search#search'

  resource :users, only: [:edit, :show] do
    member do
      get :withdraw
      get :unsubscribe
    end
    resource :genres, only: [:new, :create, :update] do
      resources :materials, only: [:create, :index, :update, :destroy] do
        resources :eats, only: [:create, :destroy]
      end
    end
  end

  resources :recipe, except: [:edit] do
    resource :favorites, only: [:create, :destroy]
    resource :reviews, only: [:create, :destroy]
    resource :recipe_materials, only: [:create, :destroy]
  end

  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
