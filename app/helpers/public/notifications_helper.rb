module Public::NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    @comment = nil
    @visiter_comment = notification.comment_id
    case notification.action
    when 'favorite' then
      tag.a(notification.visiter.name, href: public_customer_path(@visiter)) + 'が' + tag.a('あなたの投稿', href: public_recruitment_path(notification.recruitment_id)) + 'にいいねしました'
    when 'comment' then
      @comment = Comment.find_by(id: @visiter_comment)
      @recruitment_letter = @comment.recruitment.recruitment_letter
      tag.a(@visiter.name, href: public_customer_path(@visiter)) + 'が' + tag.a("#{@recruitment_letter}", href: public_recruitment_path(notification.recruitment_id)) + 'にコメントしました'
    end
  end
end
