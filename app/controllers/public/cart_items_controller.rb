class Public::CartItemsController < ApplicationController
  def index
    #@items = Item.all
    @cart_item = current_customer.cart_items#current_customer(1):cart_items(多)
    #@index_public_cart_item = Item.find(params[:id])
    @total = 0
  end

  def destroy
    @destroy_public_cart_item = Address.find(params[:id])
    @destroy_public_cart_item.destroy
    redirect_to '/cart_items'#indexへのURL
  end

  def destroy_all
    @destroy_all_public_cart_item = Address.find(params[:id])
    @destroy_all_public_cart_item.destroy
    redirect_to '/cart_items'#indexへのURL
  end

  def create
    @create_public_cart_item = CartItem.new(cart_item_params)
    @create_public_cart_item.customer_id = current_customer.id#
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

  private#indexで編集可能部分
  def cart_item_params#updateのパラメータ
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
