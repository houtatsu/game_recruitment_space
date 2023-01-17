Rails.application.routes.draw do
  # 顧客側
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  namespace :public do
    root to: 'homes#top'
    resources :recruitments, only: [:new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
    end
  end
  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show]
    resources :styles, only: [:index, :create, :edit, :update, :destroy]
    resources :play_times, only: [:index, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
