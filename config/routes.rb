Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: 'public/registrations',
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: 'admin/sessions'
}

#管理者
  namespace :admin do
    patch 'order_details/update'

    resources :orders, only: [:show, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    root to: 'homes#top'
  end

#ユーザ
  scope module: :public do
  #namespace→scope moduleに変更
  #URLは変えず、ファイル構成だけ指定のパスにする(フォルダ名にはpublicをつけて、URLにはつけない)
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    resources :orders, only: [:new, :create, :index, :show]#:comfirm, :complete, 
    #comfirmを追加
    post 'orders/comfirm'
    #completeを追加
    get 'orders/complete'

    resources :cart_items, only: [:index, :update, :destroy, :create]#:destroy_all, 
    delete 'cart_items/destroy_all'

    #resources :customers, only: [:edit, :show, :update, :unsubscribe, :withdraw]
    #→customersはURLを変更しなければいけないのでresourcesは使えない
    #resourcesは基本の7つのみ使えるので、その他は手動で追加する(追加はto:不要)
    
    #customers
    #edit URLを「/customers/:id/edit」→「/customers/information/edit」に変更
    get 'customers/information/edit', to: 'customers#edit'
    #show URLを「/customers/:id(.:format)」→「customers/my_page」に変更
    get 'customers/my_page', to: 'customers#show'
    #update URLを「/customers/:id(.:format)」→「/customers/information」に変更
    patch '/customers/information', to: 'customers#update'
    #unsubscribeを追加
    get '/customers/unsubscribe'
    #withdrawを追加
    patch '/customers/withdraw'

    resources :items, only: [:index, :show]

    #'URL' => 'コントローラ#アクション', as: :Prefix(パスが入った変数)の変更
    get '/' => 'homes#top', as: :top
    get '/about' => 'homes#about'
  end
  
  #devise_for :admins
  #devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#resources :●●s, only: [:new, :index, :show, :edit, :create, :update, :destroy ]→７つだけ書ける
#その他は get(patchなどもOK) 'orders/show' => 'orders#show'と書く