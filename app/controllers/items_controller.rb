class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @tax = @item.price * 0.1 + @item.price
    
  end
  
  def create
    
  end
end
