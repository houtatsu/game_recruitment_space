Rails.application.routes.draw do
  # 顧客側
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    root to: 'homes#top'
    resources :customers, only: [:show, :edit, :update]
  end
  # 管理者側
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :styles, only: [:index, :create, :edit, :update, :destroy]
    resources :play_times, only: [:index, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
