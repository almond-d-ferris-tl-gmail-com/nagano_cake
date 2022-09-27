class Admin::ItemsController < ApplicationController
  def index#商品一覧
    #ページネーション
    @index_admin_item = Item.page(params[:page])
  end

  def new#商品新規登録
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @new_admin_item = Item.new
    
  end

  def create
    #newで新規登録後、商品一覧ページ(indexのパス)に遷移する
    @new_admin_item = Item.new(admin_item_params)#updateのパラメータ
    if @new_admin_item.save
      redirect_to admin_items_path#indexのパス
    else
      render :new
    end
  end

  def show#同じアクション内で同じメソッドは使えない
    @show_admin_item = Item.find(params[:id])
    #@books = Book.all
    #@user = @book.user
  end

  def edit
    @edit_admin_item = Item.find(params[:id])
  end

  def update
    
  end

  private
  def admin_item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end
end
