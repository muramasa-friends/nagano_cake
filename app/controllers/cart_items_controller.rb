class CartItemsController < ApplicationController
  def index
  end
  
  def create
    @item = CartItem.new(cart_item_params)
    if @item.save
      redirect_to customer_cart_items_path
    # else
    #   session[:cart_item] = cart_item_params
    #   # @item = Item.find(params[:id])
    #   render item_path(@item)
    end
  end
  
  
  def cart_item_params
    params.require(:cart_item).permit(:item, :amount)
  end
end
