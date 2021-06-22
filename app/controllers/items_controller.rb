class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :asc)
    @item_page = @items.page(params[:page]).per(8)
  end

  def show
  end
end
