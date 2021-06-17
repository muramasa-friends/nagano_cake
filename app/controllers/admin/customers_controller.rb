class Admin::CustomersController < ApplicationController
  def index
    @admin_customers = Customer.order(created_at: :asc).page(params[:page]).per(10)
  end

  def show
    @admin_customer = Customer.find(params[:id])
  end

  def edit
  end
end
