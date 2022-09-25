class Admin::ItemsController < ApplicationController
  def index
    #ページネーション
    @index_admin_item = Item.page(params[:page])
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @new_admin_item = Item.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    @create_admin_item = Item.new(admin_item_params)
    #データをデータベースに保存するためのsaveメソッド実行
    admin_items.save
    #トップ画面へリダイレクト
    redirect_to '/admin'
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
