class Public::CustomersController < ApplicationController
  before_action :customer_set_q

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
    flash[:notice] = "保存が完了しました。"
    redirect_to public_customer_path(@customer.id)
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to new_customer_registration_path
  end

  def favorites
    @customer = Customer.find(params[:id])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:recruitment_id)
    @favorite_recruitments = Recruitment.find(favorites)
  end

  def search
    @results = @q.result
  end

  private

  def customer_set_q
    @q = Customer.ransack(params[:q])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :profile_image)
  end
end
