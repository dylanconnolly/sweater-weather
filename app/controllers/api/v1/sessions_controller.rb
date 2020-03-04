class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: {errors: "Credentials are bad."}, status: 401
    end
  end
end
