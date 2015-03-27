class Notification < ActiveRecord::Base
  belongs_to :receiver, class_name: User.name
  belongs_to :sender, class_name: User.name
  belongs_to :candidate

  def self.create_notification args
    notification = Notification.new
    notification.receiver = args[:receiver]
    notification.sender = args[:sender]
    notification.candidate = args[:candidate]
    notification.message = args[:message]
    notification.save!
    notification
  end

end
