class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :asc).page(params[:page]).per(4)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def create
    
  end

end
