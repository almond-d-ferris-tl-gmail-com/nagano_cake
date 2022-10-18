class Admin::OrderDetailsController < ApplicationController
  # ログインしていない場合、ヘッダーのボタンをクリックしたら強制的にログイン画面に移動する
  # except→ログイン画面への遷移を除外する→今回は除外するものがない
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    #@order_details = @order.order_details
    # 製作ステータスを1つ「製作中」にする→注文ステータスが「製作中」に更新される
    if params[:order_detail][:making_status] == "making"#製作中
      @order_detail.order.update(status: "making")#製作中
    # 製作ステータスを全て「製作完了」にする→注文ステータスが「発送準備中」に更新される
    #(左)注文ステータス:orderのorder_details(n)の数が(右)製作ステータス:orderのorder_details(n)の製作完了した数と同じか判定
    elsif @order.order_details.count == @order.order_details.where(making_status: "made").count#製作完了
      @order_detail.order.update(status: "preparing")#発送準備中
    end
    redirect_to admin_order_path(@order_detail.order.id), notice: "ステータスを変更しました"#admin/orders#show
  end
  
  private
  def order_detail_params#注文ステータス変更、製作ステータス変更
  #permitメソッド:paramsで取得したパラメーターに対し保存の許可を行う
    params.require(:order_detail).permit(:making_status)
  end
  
end
