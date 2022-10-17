class Admin::OrderDetailsController < ApplicationController
  # ログインしていない場合、ヘッダーのボタンをクリックしたら強制的にログイン画面に移動する
  # except→ログイン画面への遷移を除外する→今回は除外するものがない
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    if params[:order_detail][:making_status] == "making"
      @order_detail.order.update(status: "making")
    end
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail.order.id), notice:"ステータスを変更しました"
  end
  
  private
  def order_detail_params#注文ステータス変更、製作ステータス変更
  #permitメソッド:paramsで取得したパラメーターに対し保存の許可を行う
    params.require(:order_detail).permit(:making_status)
  end
  
end
