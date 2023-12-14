Rails.application.routes.draw do
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
    get "contact"=>"homes#contact"
    post "posts/:id/comments/:id/favorites/:id"=>"favorites#create"
    delete "posts/:id/comments/:id/favorites/:id"=>"favorites#delete"
    get "search"=>"searches#search"
    get "typing"=>"typings#index"

    resources :users, only: [:show, :edit, :update] #カスタムURLにしたいから後で変更するかも
    resources :typings, only: [:new, :create]
    resources :posts, only: [:index, :new, :create, :show] do #edit,destoryは後から追加するか
      resources :comments, only: [:create, :destroy, :edit, :update] do
        resources :favorites, only: [:create, :destroy]
      end
    end
  end

  namespace :admin do
    get "/"=>"homes#top"
  end
end