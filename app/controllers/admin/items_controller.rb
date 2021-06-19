class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    @tax = @item.price * 0.1 + @item.price
  end

  def edit
  end

end
