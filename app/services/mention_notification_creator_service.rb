class MentionNotificationCreatorService < MentionService

  def initialize args
    @receiver = args[:receiver]
    @sender = args[:sender]
    @candidate = args[:candidate]
    @message = args[:message]
  end

  def create
    Notification.create_notification notification_params
  end

end
