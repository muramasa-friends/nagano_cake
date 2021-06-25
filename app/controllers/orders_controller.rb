class OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def new
    @order = Order.new
    @customer = current_customer
    @cart = @customer.cart_items
    if @cart.empty?
        redirect_to items_path, alert: "カートに商品が入っていません。"
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    if @order.invalid?
      redirect_to new_order_path, alert: "配送先情報を入力してください" 
    else
      if params[:order][:address_option] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.full_name

      elsif params[:order][:address_option] == "1"
        if @address = Address.find(params[:order][:address_id])
           @order.postal_code = @address.postal_code
           @order.address = @address.address
           @order.name = @address.name
        else
          render :new
        end

      elsif params[:order][:address_option] == "2"
       @order.postal_code = params[:order][:postal_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
      end
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.amount = cart_item.amount
        @order_items.price = cart_item.item.price * 1.1
        @order_items.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render 'confirm'
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def complete
  end


  private

  def order_params
    params.require(:order).permit(:shipping_fee, :payment_amount, :payment_method, :status, :postal_code, :name, :address,:item_id, :price, :amount)
  end

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

end
