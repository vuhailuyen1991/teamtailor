class MentionService

  def initialize args
    @receiver = args[:receiver]
    @sender = args[:sender]
    @candidate = args[:candidate]
    @message = args[:message]
  end


  def mention
    notification = create_notification
    send_email notification
    notification
  end

  protected
  def notification_params
    {
      receiver: @receiver,
      sender: @sender,
      candidate: @candidate,
      message: @message
    }
  end

  private
  def create_notification
    MentionNotificationCreatorService.new(notification_params).create
  end

  def send_email notification
    MentionMailerService.new(notification: notification).send
  end
end
