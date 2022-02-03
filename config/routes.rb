Rails.application.routes.draw do

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resource :customers, only: [:edit, :update]
    get 'customers/mypage', to: 'customers#show', as: 'mypage'
    get 'customers/withdraw', to: 'customers#withdraw', as: 'confirm_withdraw'
    patch 'customers/change', to: 'customers#change', as: 'change_customers'
  end


  devise_for :admin, skip: [:registrations, :passwords] , controllers: {
    sessions: 'admin/sessions'
  }

  devise_for :customers,skip: [:passwords,], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'admin' => 'admin/homes#top'

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :edit, :update, :create, :show]
    resources :customers, only: [:index, :show, :edit, :update]
  end


end
