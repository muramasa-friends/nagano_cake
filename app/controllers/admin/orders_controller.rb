class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.page(params[:page]).reverse_order.per(10)
  end

  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(@order.customer_id)
    @order_items = OrderItem.where(order_id: @order.id)
    @total = 0
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      OrderItem.where(order_id: @order.id).update_all(production_status: "製作待ち") if @order.status == "入金確認"
      redirect_to request.referer, notice: "You have update status successfully."
    else
      render :show
    end
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end


end
