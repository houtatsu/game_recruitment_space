class PlayTime < ApplicationRecord
  has_many :recruitments, dependent: :destroy

  validates :name, presence: true
end
