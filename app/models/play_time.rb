class PlayTime < ApplicationRecord
  has_many :recruitments, dependent: :destroy
end
