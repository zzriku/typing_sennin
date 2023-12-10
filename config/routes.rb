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
  end

  scope module: :public do
    root to: "homes#top"
    get "contact"=>"homes#contact"

    resources :users, only: [:show, :edit, :update] #カスタムURLにしたいから後で変更するかも
    resources :posts, only: [:index, :new, :create, :show] #edit,destoryは後から追加するかも
    resources :favorites, only: [:create, :destroy]
    resources :comments , only: [:create, :destroy, :create, :update]
    resources :typings, only: [:new, :create]
  end

  namespace :admin do
    get "/"=>"homes#top"
  end
end