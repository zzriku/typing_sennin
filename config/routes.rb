Rails.application.routes.draw do
  get "/javascript/audios/_sound_incorrect1.mp3"=>"controller_name#action_name"
  get "/javascript/audios/_sound_correct.mp3"=>"controller_name#action_name"

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :user do
    post "users/guest_sign_in"=>"public/sessions#guest_sign_in"
    get "users/guest_sign_in"=>"public/sessions#guest_sign_in"
    delete "users/guest_sign_out"=>"public/sessions#destroy"
  end

  scope module: :public do
    root to: "homes#top"
    post "posts/:id/comments/:id/favorites/:id"=>"favorites#create", as: :post_comment_favorites
    delete "posts/:id/comments/:id/favorites/:id"=>"favorites#destroy", as: :post_comment_favorite
    get "posts/:id/comments/:id"=>"posts#show"
    get "posts/:id/comments/:id/favorites/:id"=>"posts#show"
    get "search"=>"searches#search"
    get "typing"=>"typings#index"
    get "type.js"=>"typings#index"

    resources :users, only: [:show, :edit, :update] do
      member do
        get :liked_comments
      end
    end
    resources :contacts, only: [:new, :create]
    resources :typings, only: [:index]
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:create, :destroy, :edit, :update] do
        resources :favorites, only: [:create, :destroy]
      end
    end
  end

  namespace :admin do
    get "/"=>"homes#top"
    get "admins/sign_out"=>"admin/sessions#destroy"
    #get "admin/users/:id/edit"=>"users#edit"
    #get "admin/posts/:id/comments/:id"=>"posts#show"
    get '/search', to: 'searches#search', as: :admin_search
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :withdraw
      end
    end
    resources :posts, only: [:index, :show, :destroy, :update] do
      resources :comments, only: [:index, :destroy, :update,]
    end
  end
end