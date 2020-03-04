class Api::V1::RoadTripController < ApplicationController
  before_action :valid_key?

  def create
    render json: RoadTripSerializer.new(RoadTripFacade.new(params))
  end

  private

  def valid_key?
    render json: {errors: "Bad credentials"}, status: 401 unless User.find_by_api_key(params[:api_key])
  end

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
