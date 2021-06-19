class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.order(created_at: :asc).page(params[:page]).per(10)
  end

  def show
    
  end

  def edit
  end
end
