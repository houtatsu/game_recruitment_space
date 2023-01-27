class Recruitment < ApplicationRecord
  belongs_to :style
  belongs_to :play_time
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :recruitment_letter, presence: true

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def create_notification_favorite!(current_customer)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and recruitment_id = ? and action = ? ", current_customer.id, customer_id, id, 'favorite'])
    if temp.blank?
      notification = current_customer.active_notifications.new(
        recruitment_id: id,
        visited_id: customer_id,
        action: 'favorite'
      )
      if notification.visiter_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_customer, comment_id)
    temp_ids = Comment.select(:customer_id).where(recruitment_id: id).where.not(customer_id: current_customer.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_customer, comment_id, temp_id['customer_id'])
    end
    save_notification_comment!(current_customer, comment_id, customer_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_customer, comment_id, visited_id)
    notification = current_customer.active_notifications.new(
      recruitment_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )

    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
