class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @recruitments = Recruitment.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer.id)
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:recruitment_id)
    @favorite_recruitments = Recruitment.find(favorites)
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :profile_image)
  end
end
