class Admin::OrdersController < ApplicationController
  def show
    #@show_admin_order = Order.all
    @order = Order.find(params[:id])
    #@customer = Customer.find(params[:id])
  end

  def update
    #showで更新後、注文履歴詳細(show)に遷移する
    @order = Order.find(params[:id])
    if @order.update(order_params)#updateのパラメータ
      redirect_to admin_order_path#show
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
