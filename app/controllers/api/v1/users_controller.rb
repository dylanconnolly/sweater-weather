class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: ErrorsSerializer.new(user, 403), status: 403
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
