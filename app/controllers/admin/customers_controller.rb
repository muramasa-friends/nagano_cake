class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.order(created_at: :asc).page(params[:page]).per(10)
  end

  def show
<<<<<<< HEAD
    @customer = Customer.find(params[:id])
=======
    
>>>>>>> ede817e08d28a9c3cd6d6d7874e9f205e4cdcef5
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.admin_id = current_user.id
    if @customer.update(customer_params)
      redirect_to admin_customer_path(customer.id)
    else
      render 'edit'
    end
  end
  
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end
