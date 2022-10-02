class Public::ItemsController < ApplicationController
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
    @show_public_item = Item.find(params[:id])
    @cart_item = CartItem.new#新規注文
  end
end
