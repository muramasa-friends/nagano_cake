class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(@order.customer_id)
    @order_items = OrderItem.where(order_id: @order.id)
  end
end
