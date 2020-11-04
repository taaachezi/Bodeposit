Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  root 'top#top'
  get 'user_top/:id' => 'top#user_top', as: "user_top"
  get 'how_use' => 'top#how_use', as: "how_use"
  get 'search/search' => 'search#search'
  # recipe_material/new.html ジャンル選択後のurlに対応
  get '/recipes/:recipe_id/recipe_materials' => "recipe_materials#new"

  resources :events
  
  resources :users, only: [:show, :update] do
    member do
      get :withdraw
      patch :unsubscribe
    end
    resources :eats, only: [:create, :destroy] do
      collection do
        delete :destroy_all
      end
    end
    resource :messages, only: [:create]
  end

  resource :genres, only: [:new, :create, :update, :destroy] do
    resources :materials, only: [:create, :index, :update, :destroy] do
      collection do
        get :search
      end
    end
  end

  resources :recipes do
    resource :favorites, only: [:create, :destroy]
    resource :reviews, only: [:create, :destroy]
    resources :recipe_materials, only: [:new, :create, :destroy]
  end

  resources :chats, only: [:show, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
