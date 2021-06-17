class AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer)
  end
　
  def edit
    @address = Address.find(params[:id])
  end
end
