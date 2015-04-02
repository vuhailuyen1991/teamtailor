class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :sender, :receiver, :message

  def sender
    object.sender.username
  end

  def receiver
    object.receiver.username
  end

end
