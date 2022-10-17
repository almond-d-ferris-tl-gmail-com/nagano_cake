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
    if @order.update(order_params)#updateのパラメータ
      if @order.status == "confirming"#入金確認
        @order_details.each do |order_detail|
          order_detail.update(making_status: 1)
        end
        #admin/orders#show
        redirect_to admin_order_path(@order.id), notice:"ステータスを変更しました"
      end
    else
      render :show
    end
  end
  
  private
  def order_params#注文ステータス変更、製作ステータス変更
  #permitメソッド:paramsで取得したパラメーターに対し保存の許可を行う
    params.require(:order).permit(:status)
  end
end
