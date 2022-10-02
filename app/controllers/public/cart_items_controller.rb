class Public::CartItemsController < ApplicationController
  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @create_public_cart_item = CartItem.new#(book_params)
    #@book.user_id = current_user.id
    #@books = Book.all
    #注文の追加
    if @create_public_cart_item.save
      #flash[:notice] = "You have created book successfully."
      redirect_to cart_items#カートのindex
    else
      #他のコントローラーのテンプレートを呼び出す"コントローラー名/アクション名"
      render template: "items/show"
    end
  end
end
