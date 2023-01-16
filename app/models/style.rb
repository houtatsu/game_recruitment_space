class Style < ApplicationRecord
  has_many :recruitments, dependent: :destroy
end
