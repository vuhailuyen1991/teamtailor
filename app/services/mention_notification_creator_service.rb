class MentionNotificationCreatorService

  def initialize args
    @receiver = args[:receiver]
    @sender = args[:sender]
    @candidate = args[:candidate]
    @message = args[:message]
  end

  def create
    Notification.create_notification notification_params
  end

  private
  def notification_params
    {
      receiver: @receiver,
      sender: @sender,
      candidate: @candidate,
      message: @message
    }
  end

end
