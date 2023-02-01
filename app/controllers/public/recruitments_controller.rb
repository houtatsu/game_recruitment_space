class Public::RecruitmentsController < ApplicationController
  before_action :set_q

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.customer_id = current_customer.id
    if @recruitment.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to public_recruitment_path(@recruitment.id)
    else
      render :new
    end
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
    flash[:notice] = "保存が完了しました。"
    redirect_to public_recruitment_path(@recruitment.id)
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    flash[:notice] = "削除が完了しました。"
    redirect_to public_root_path
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Recruitment.ransack(params[:q])
  end

  def recruitment_params
    params.require(:recruitment).permit(:recruitment_letter, :style_id, :play_time_id)
  end
end
