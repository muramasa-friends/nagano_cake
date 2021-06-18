class Admin::CustomersController < ApplicationController
  def index
  end

  def show
    @admin_customer = Customer.find(params[:id])
  end

  def edit
  end
end
