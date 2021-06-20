class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order_items = current_customer.order_item
    @order.payment_method = params[:order][:payment_method]
      if params[:order][:address_option] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.name

      elsif params[:order][:address_option] == "1"
       @sta = params[:order][:address].to_i
       @address = Address.find(@sta)
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name

      elsif params[:order][:address_option] == "2"
       @order.postal_code = params[:order][:postal_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
      end
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

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

end
