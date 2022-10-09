class Public::OrdersController < ApplicationController
  def new
    @new_public_order = Order.new
    @customer = current_customer
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
  
  def comfirm
    #binding.pry#ここで処理が終了→
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    
    @comfirm_public_order = current_customer.cart_items#current_customer(1):cart_items(多)
    @item_amount = 0#商品合計
    @billing_amount = 0#請求金額
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
