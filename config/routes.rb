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
  
    root to: 'homes#top'
    #get 'homes/top'
  end

#ユーザ
  scope module: :public do
  #namespace→scope moduleに変更
  #URLは変えず、ファイル構成だけ指定のパスにする(フォルダ名にはpublicをつけて、URLにはつけない)
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    #get 'addresses/index'
    #get 'addresses/edit'
    #post 'addresses/create'
    #patch 'addresses/update'
    #delete 'addresses/destroy'

    resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
    #get 'orders/new'
    #post 'orders/comfirm'
    #get 'orders/complete'
    #post 'orders/create'
    #get 'orders/index'
    #get 'orders/show'

    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    #get 'cart_items/index'
    #patch 'cart_items/update'
    #delete 'cart_items/destroy'
    #delete 'cart_items/destroy_all'
    #post 'cart_items/create'

    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
    #get 'customers/show'
    #get 'customers/edit'
    #patch 'customers/update'
    #get 'customers/unsubscribe'
    #patch 'customers/withdraw'

    #get 'sessions/new'
    #post 'sessions/create'
    #delete 'sessions/destroy'

    #get 'registrations/new'
    #post 'registrations/create'

    resources :items, only: [:index, :show]
    #get 'items/index'
    #get 'items/show'

    #'URL' => 'コントローラ#アクション', as: :Prefix(パスが入った変数)の変更
    get "/" => 'homes#top', as: :top
    get "/about" => "homes#about"
    #get 'homes/top'
    #get 'homes/about'
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