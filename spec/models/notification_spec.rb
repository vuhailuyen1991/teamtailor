require 'rails_helper'

describe Notification do
  describe "Notification#create_notification" do
    it "a notification should be created" do
      receiver = create :user
      sender = create :user
      candidate = create :candidate
      params = { receiver: receiver, sender: sender, candidate: candidate, message: 'He is the best' }
      notification = Notification.create_notification params
      expect(notification.class.name).to eq('Notification')
    end
  end
end
