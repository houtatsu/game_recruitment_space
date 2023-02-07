class Admin::StylesController < ApplicationController
  def index
    @style = Style.new
    @styles = Style.all
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:notice] = "作成しました。"
      redirect_to admin_styles_path
    else
      @styles = Style.all
      render :index
    end
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    if @style.update(style_params)
      flash[:notice] = "更新しました。"
      redirect_to admin_styles_path
    else
      @styles = Style.all
      render :index
    end
  end

  def destroy
    @style = Style.find(params[:id])
    @style.destroy
    flash[:notice] = "削除しました。"
    redirect_to admin_styles_path
  end

  private

  def style_params
    params.require(:style).permit(:name)
  end
end
