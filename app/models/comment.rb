class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :recruitment
  has_many :notifications, dependent: :destroy
end
