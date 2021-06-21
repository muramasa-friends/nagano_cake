class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer)
    @numbers = Array.new(10){|i| i + 1}
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id 
    if @cart_item.save
      redirect_to customer_cart_items_path
    else
      session[:cart_item] = cart_item_params
      @item = Item.find_by(params[:item_id])
      render "items/show"
    end
  end


  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
