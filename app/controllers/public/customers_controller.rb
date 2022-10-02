class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    #@customer = Customer.all
    @customer = current_customer
    #@customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
end
