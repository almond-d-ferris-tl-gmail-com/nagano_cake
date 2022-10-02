class Public::HomesController < ApplicationController
  def top
    #@top_public_home = Home.find(params[:id])
    #サイドバー
    @genres = Genre.all
    # 新着商品を最新から4件取得
    #idを新着順に並び替える→新着４件を取り出す
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end
end
