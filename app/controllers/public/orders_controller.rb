class Public::OrdersController < ApplicationController
  def new#注文情報入力
    @new_public_order = Order.new
    @customer = current_customer
  end

  def complete#注文確定(サンクス)
  end

  def create#new:注文情報入力→comfirm:注文情報確認→create→complete:注文確定(サンクス)
    cart_items = current_customer.cart_items.all
    # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れる
    @create_public_order = current_customer.orders.new(order_params)
      # 渡ってきた値を @create_public_order に入れる
      if @create_public_order.save
      # ここに至るまでの間にチェックは済んでいるが、念の為IF文で分岐させる
          cart_items.each do |cart|
          # 取り出したカートアイテムの数分繰り返す
          # order_item にも一緒にデータを保存する必要があるのでここで保存する
          # 購入が完了したらカート情報は削除するのでこちらに保存する
          order_item = OrderDetail.new
          order_item.item_id = cart.item_id
          order_item.order_id = @create_public_order.id
          #order_item.order_get_image = cart.get_image#商品画像
          #order_item.order_name = cart.name#商品名
          order_item.price = cart.item.price#税込 cart.priceだとカートに税込カラムがないといけない→item_idがある→アソシエーションでつなげる
          order_item.amount = cart.amount#数量
          #order_item.order_subtotal_price = cart.subtotal_price#小計
          # カート情報を削除するので item との紐付けが切れる前に保存する
          order_item.save
          end
          cart_items.destroy_all#cart_items_destroy_all#データ削除の遷移先(public/cart_items#destroy_all)
        redirect_to orders_complete_path#public/orders#complete(注文確定(サンクス))
        # ユーザーに関連するカートのデータ(購入したデータ)をすべて削除(カートを空にする)
      else
        @create_public_order = Order.new(order_params)
        render :new
      end
  end

  def index
    #@purchase_history = current_customer.cart_items#current_customer(1):cart_items(多)
    @index_public_order = Order.all
  end

  def show
    @show_public_order = Order.find(params[:id])
  end
  
  def comfirm#new:注文情報入力→comfirm:注文情報確認→create→complete:注文確定(サンクス)
    #binding.pry#rails sをするとここで処理が一旦止まる→確認のためのコマンドを入力する
    if params[:order][:select_address] == "0"#自身の住所
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:order][:select_address] == "1"#登録済み住所
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:select_address] == "2"#新しいお届け先
      @order = Order.new(order_params)
    end
    
    @comfirm_public_order = current_customer.cart_items#current_customer(1):cart_items(多)
    @shipping_cost = 800#送料
    @order.shipping_cost = @shipping_cost
    @total_payment = 0#商品合計→請求額
  end
  
  private
  def order_params#新しいお届け先(支払方法、郵便番号、住所、名前)
  #permitメソッド:paramsで取得したパラメーターに対し保存の許可を行う
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
