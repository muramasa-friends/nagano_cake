class Admin::ItemsController < ApplicationController
  def index
  end

  def new

  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

end
