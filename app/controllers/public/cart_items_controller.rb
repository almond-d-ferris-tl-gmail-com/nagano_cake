class Public::CartItemsController < ApplicationController
  def index
    @cart_item = current_customer.cart_items#current_customer(1):cart_items(多)
    @total = 0
  end

  def destroy
    @destroy_public_cart_item = CartItem.find(params[:id])
    @destroy_public_cart_item.destroy
    redirect_to '/cart_items'#indexへのURL
  end

  def destroy_all
    @destroy_all_public_cart_item = CartItem.find(params[:id])
    @destroy_all_public_cart_item.destroy
    redirect_to '/cart_items'#indexへのURL
  end

  def create
    @create_public_cart_item = CartItem.new(cart_item_params)#updateのパラメータ
    @create_public_cart_item.customer_id = current_customer.id#顧客idと現在ログインしている顧客idを結びつける
    #注文の追加
    if @create_public_cart_item.save
      redirect_to cart_items_path#カートのpublic/cart_items#index
    else
      #他のコントローラーのテンプレートを呼び出す"コントローラー名/アクション名"
      render template: "items/show"
    end
  end
  
  def update
    @update_public_cart_item = CartItem.find(params[:id])
    if @update_public_cart_item.update(cart_item_params)#updateのパラメータ
      redirect_to cart_items_path#index
    else
      render :index
    end
  end

  private
  def cart_item_params#updateのパラメータ
    params.require(:cart_item).permit(:item_id, :amount)#permitメソッド:paramsで取得したパラメーターに対し保存の許可を行う
  end
end
