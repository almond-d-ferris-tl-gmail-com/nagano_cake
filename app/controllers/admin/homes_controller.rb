class Admin::HomesController < ApplicationController
  def top
    #ページネーション
    @orders = Order.all.page(params[:page]).per(10)
  end
end
