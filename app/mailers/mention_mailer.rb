class MentionMailer < BaseMailer

  def mention_email notification_id
    notification = Notification.find notification_id
    if notification.present?
      @sender = notification.sender
      @receiver = notification.receiver
      @message = notification.message
      @candidate = notification.candidate
      subject = I18n.t('mention_email.subject', user: @sender.full_name, candidate: @candidate.full_name)
      send_mail(@sender.full_name, @sender.email, @receiver.email, subject)
    end
  end

end
