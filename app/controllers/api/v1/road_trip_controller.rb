class Api::V1::RoadTripController < ApplicationController
  before_action :valid_key?

  def create
    require "pry"; binding.pry
  end

  private

  def valid_key?
    render json: "Bad credentials", status: 401 unless User.find_by_api_key(params[:api_key])
  end

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
