class Public::ItemsController < ApplicationController
  # ログインしていない場合、ヘッダーのボタンをクリックしたら強制的にログイン画面に移動する
  # except→ログイン画面への遷移を除外する→indexボタンを押したらindexに遷移する
  before_action :authenticate_customer!, except: [:index]#customer→テーブル名
  
  def index#商品一覧
    #ページネーション
    @index_public_item = Item.page(params[:page])
    #サイドバー
    @genres = Genre.all
    #商品一覧　idを新着順に並び替える
    @items = Item.order('id DESC')
    #商品の最大値を取得
    @items_max = Item.maximum(:id)

  end

  def show
    #サイドバー
    @genres = Genre.all
    @show_public_item = Item.find(params[:id])
    @cart_item = CartItem.new#新規注文
  end
end
