class Admin::ItemsController < ApplicationController
  def index
  end

  def new

  end

  def show
    @item = Item.find(params[:id])
    @tax = @item.price * 0.1 + @item.price
  end



  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
  end


end
