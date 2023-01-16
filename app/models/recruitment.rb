class Recruitment < ApplicationRecord
  belongs_to :style
  belongs_to :play_time
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
