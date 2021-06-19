class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.new
  end

  def confirm
    @cart_item = Customer.cart_item
    @order = Order.new(order_params)
  end

  def create
    @cart_item = Customer.cart_item
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render new
    end
  end

  def show
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :name, :address, :shipping_fee, :payment_amount, :item_id, :amount, :price)
  end

end
