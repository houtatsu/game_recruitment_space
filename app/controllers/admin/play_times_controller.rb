class Admin::PlayTimesController < ApplicationController
  def index
    @play_time = PlayTime.new
    @play_times = PlayTime.all
  end

  def create
    @play_time = PlayTime.new(play_time_params)
    if @play_time.save
      redirect_to admin_play_times_path
    else
      @play_times = PlayTime.all
      render :index
    end
  end

  def edit
    @play_time = PlayTime.find(params[:id])
  end

  def update
    @play_time = PlayTime.find(params[:id])
    if @play_time.update(play_time_params)
      redirect_to admin_play_times_path
    else
      @play_times = PlayTime.all
      render :index
    end
  end

  def destroy
    @play_time = PlayTime.find(params[:id])
    @play_time.destroy
    redirect_to admin_play_times_path
  end

  private

  def play_time_params
    params.require(:play_time).permit(:name)
  end
end
