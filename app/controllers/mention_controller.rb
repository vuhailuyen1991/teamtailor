class MentionController < ApplicationController
  before_filter :validate_mention, only: [:create]

  def create
    if receiver_setting.mention_immediately?
      MentionService.new(mention_params).mention
    end
    render json: nil
  end

  private

  def validate_mention
    if !params[:sender] or !params[:receiver] or !params[:receiver]
      render json: { message: 'Missing parameter' }, status: :bad_request
    end
    @sender = User.find_by_username params[:sender]
    @receiver = User.find_by_username params[:receiver]
    @candidate = Candidate.find params[:candidate_id]
    @message = params[:message]
  end

  def mention_params
    { receiver: @receiver, sender: @sender, candidate: @candidate, message: @message }
  end

  def receiver_setting
    @receiver.user_setting
  end

end
