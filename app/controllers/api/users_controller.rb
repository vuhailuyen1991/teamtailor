class Api::UsersController < ApplicationController
  respond_to :json

  def index
    users = ActiveModel::ArraySerializer.new(User.all, each_serializer: UserSerializer)
    render json: users.to_json
  end

end
