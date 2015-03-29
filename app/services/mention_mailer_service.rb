class MentionMailerService

  def initialize args
    @notification = args[:notification]
  end

  def send
    MentionMailer.mention_email(@notification.id)
  end

end
