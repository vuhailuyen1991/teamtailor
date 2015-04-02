class Sockets::MentionController < WebsocketRails::BaseController
  before_filter :validate_mention, only: [:create]

  def create
    if receiver_setting.mention_immediately?
      noti = MentionService.new(mention_params).mention
      trigger_success({message: 'mentions.create_success'})
      broadcast_message 'mentions.create_success', NotificationSerializer.new(noti).serializable_hash

    end
  end

  private

  def validate_mention
    if !message[:sender] or !message[:receiver] or !message[:receiver]
      trigger_failure message: 'Bad Request'
    end
    @sender = User.find_by_username message[:sender]
    @receiver = User.find_by_username message[:receiver]
    @candidate = Candidate.find message[:candidate_id]
    @message = message[:message]
  end

  def mention_params
    { receiver: @receiver, sender: @sender, candidate: @candidate, message: @message }
  end

  def receiver_setting
    @receiver.user_setting
  end

end
