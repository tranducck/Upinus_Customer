class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "Create customer successfully"
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end
end
