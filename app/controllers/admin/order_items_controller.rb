class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(@order_item.order_id)
    @order_items = OrderItem.where(order_id: @order.id)
    if @order_item.update(order_item_params)
      @order.update(status: "発送準備中") if @order_items.where(production_status: "製作完了").size ==  @order_items.size
      @order.update(status: "製作中") if @order_items.find_by(production_status: "製作中")
      redirect_to request.referer, notice: "You have update production status successfully."
    else
      @order_item = OrderItem.find(params[:id])
      @order = Order.find(@order_item.order_id)
      @customer = Customer.find(@order.customer_id)
      @order_items = OrderItem.where(order_id: @order.id)
      render "admin/orders/show"
    end
  end

  private
  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end
