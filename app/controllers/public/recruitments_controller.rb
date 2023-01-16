class Public::RecruitmentsController < ApplicationController
  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.customer_id = current_customer.id
    @recruitment.save
    redirect_to public_recruitment_path(@recruitment.id)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    @recruitment.update(recruitment_params)
    redirect_to public_recruitment_path(@recruitment.id)
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to public_root_path
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:recruitment_letter, :style_id, :play_time_id)
  end
end
