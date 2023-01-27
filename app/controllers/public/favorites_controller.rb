class Public::FavoritesController < ApplicationController
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    @favorite = current_customer.favorites.new(recruitment_id: recruitment.id)
    @favorite.save
    recruitment.create_notification_favorite!(current_customer)
    redirect_to public_recruitment_path(recruitment)
  end

  def destroy
    recruitment = Recruitment.find(params[:recruitment_id])
    @favorite = current_customer.favorites.find_by(recruitment_id: recruitment.id)
    @favorite.destroy
    redirect_to public_recruitment_path(recruitment)
  end
end
