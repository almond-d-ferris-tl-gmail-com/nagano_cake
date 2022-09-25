Rails.application.routes.draw do

#管理者
  namespace :admin do
    patch 'order_details/update'

    resources :orders, only: [:show, :update]
    #get 'orders/show' => 'orders#show'
    #patch 'orders/update'

    resources :customers, only: [:index, :show, :edit, :update]
    #get 'customers/index'
    #get 'customers/show'
    #get 'customers/edit'
    #patch 'customers/update'

    resources :genres, only: [:index, :create, :edit, :update]
    #get 'genres/index'
    #post 'genres/create'
    #get 'genres/edit'
    #patch 'genres/update'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    #get 'items/index'
    #get 'items/new'
    #post 'items/create'
    #get 'items/show'
    #get 'items/edit'
    #patch 'items/update'

  #namespace :admin do
    #resources :sessions, only: [:new, :create, :destroy]
    #get 'sessions/new'
    #post 'sessions/create'
    #derete 'sessions/destroy'
  #end
  
    root to: 'homes#top', as: "root"
    #get 'homes/top'
  end

#ユーザ
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
  end
  
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  
  #namespace :public do
    #get 'sessions/new'
    #get 'sessions/create'
    #get 'sessions/destroy'
  #end
  
  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
  
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  
  #devise_for :admins
  #devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#resources :●●s, only: [:new, :index, :show, :edit, :create, :update, :destroy ]→７つだけ書ける
#その他は get(patchなどもOK) 'orders/show' => 'orders#show'と書く