class Admin::OrdersController < ApplicationController
  # ログインしていない場合、ヘッダーのボタンをクリックしたら強制的にログイン画面に移動する
  # except→ログイン画面への遷移を除外する→今回は除外するものがない
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)#updateのパラメータ
    # 注文ステータスを「入金待ち」にする→製作ステータスが全て「製作不可」に更新される
    if @order.status == "waiting"#入金待ち
        @order_details.each do |order_detail|
          order_detail.update(making_status: 0)#製作不可
        end
    # 注文ステータスを「入金確認」にする→製作ステータスが全て「製作待ち」に更新される
    elsif @order.status == "confirming"#入金確認
        @order_details.each do |order_detail|
          order_detail.update(making_status: 1)#製作待ち
        end
    # 注文ステータスを「発送済み」にする→注文ステータスが「発送済み」に更新される
    #elsif @order.status == "sent"#発送済み
    end
    redirect_to admin_order_path(@order.id), notice: "ステータスを変更しました"#admin/orders#show
  end
  
  private
  def order_params#注文ステータス変更、製作ステータス変更
  #permitメソッド:paramsで取得したパラメーターに対し保存の許可を行う
    params.require(:order).permit(:status)
  end
end
