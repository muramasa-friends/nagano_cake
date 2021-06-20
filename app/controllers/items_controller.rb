class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :asc).page(params[:page]).per(8)
  end

  def show
  end
end
