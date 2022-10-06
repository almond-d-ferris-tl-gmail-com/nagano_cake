class Admin::HomesController < ApplicationController
  def top
    #ページネーション
    #@page = Customer.all.page(params[:page]).per(10)
    @orders = Order.all
  end
end
