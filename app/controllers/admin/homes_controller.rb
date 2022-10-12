class Admin::HomesController < ApplicationController
  def top
    #ページネーション
    @top_admin_home = Order.all.page(params[:page]).per(10)
  end
end
