class Api::CandidatesController < ApplicationController
  respond_to :json

  def index
    candidates = ActiveModel::ArraySerializer.new(Candidate.all, each_serializer: CandidateSerializer)
    render json: candidates.to_json
  end

  def show
    candidate = Candidate.find params[:id]
    render json: CandidateSerializer.new(candidate).serializable_hash
  end

end
