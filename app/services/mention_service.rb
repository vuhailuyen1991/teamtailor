class Services::MentionService

  def initialize args
    @receiver = args[:receiver]
    @sender = args[:sender]
    @candidate = args[:candidate]
    @message = args[:message]
  end


  def mention
    send_notification
    send_email
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
  def send_notification
    @notification = Services::MentionNotificationCreatorService.new(notification_params).create
  end

  def send_email
    Services::MentionMailerService.new(@notification).send
  end
end
