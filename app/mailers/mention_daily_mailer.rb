class MentionDailyMailer < BaseMailer

  def daily_email user_id
    @user = User.find user_id
    if @user.present?
      @notifications = Notification.daily.by_receiver user_id
      if @notifications.present?
        subject = I18n.t('mention_daily_email.subject')
        system_mail(@user.email, subject)
      end
    end
  end

end
