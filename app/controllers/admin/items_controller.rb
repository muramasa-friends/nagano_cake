class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new

  end

  def show
    @item = Item.find(params[:id])
    @tax = @item.price * 0.1 + @item.price
  end

  def edit
  end

end
