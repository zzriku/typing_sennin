Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: "homes#top"
    get "contact"=>"homes#contact"

    post "users/guest_sign_in"=>"users/sessions#guest_sign_in"
    get "users/guest_sign_in"=>"users/sessions#guest_sign_in"
    get "users/profile"=>"users#show"
    get "users/profile/edit"=>"users#edit"
    patch "users/profile"=>"users#update"

    resources :posts, except: [:index]
    resources :favorites, only: [:create, :destroy]
    resources :comments , only: [:create, :destroy]
    resources :typings, only: [:new, :create]
  end

  namespace :admin do
    get "/"=>"homes#top"
  end
end
