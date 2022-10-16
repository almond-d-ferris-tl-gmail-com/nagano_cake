class Admin::OrdersController < ApplicationController
  # ログインしていない場合、ヘッダーのボタンをクリックしたら強制的にログイン画面に移動する
  # except→ログイン画面への遷移を除外する→今回は除外するものがない
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    #showで更新後、注文履歴詳細(show)に遷移する
    @order = Order.find(params[:id])
    if @order.update(order_params)#updateのパラメータ
      redirect_to admin_order_path(@order.id)#admin/orders#show
    else
      render :show
    end
  end
  
  private
  def order_params#注文ステータス変更、製作ステータス変更
  #permitメソッド:paramsで取得したパラメーターに対し保存の許可を行う
    params.require(:order).permit(:status, :making_status)
  end
end
