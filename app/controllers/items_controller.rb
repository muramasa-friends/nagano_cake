class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :asc).page(params[:page]).per(4)
  end

  def show
    @item = Item.find(params[:id])
  end

end
