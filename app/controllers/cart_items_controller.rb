class CartItemsController < ApplicationController
  
  def index
    
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to customer_cart_items_path
    else
      session[:cart_item] = cart_item_params
      @item = Item.find(params[:id])
      render item_path(@item)
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item, :amount)
  end
  
end
