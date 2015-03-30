require 'rails_helper'

RSpec.describe MentionController, type: :controller do
  let(:huddle) { create :huddle, published: true }
  describe "create#mention" do
    it "should return 200 http code" do
      receiver = create :user, username: 'username1'
      sender = create :user, username: 'username2'
      candidate = create :candidate
      message = 'He is fantastics'
      user_setting = create :user_setting, user: receiver

      post :create, sender: sender.username, receiver: receiver.username, message: message, candidate_id: candidate.id
      response.status.should eq 200
    end

    it "should return 401 http code" do
      receiver = create :user, username: 'username1'
      candidate = create :candidate
      message = 'He is fantastics'

      post :create, receiver: receiver.username, message: message, candidate_id: candidate.id
      response.status.should eq 400
    end
  end
end
