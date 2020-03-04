class Api::V1::RoadTripController < ApplicationController
  before_action :valid_key?

  def create
    directions_api_data = GoogleMapsService.new.get_directions(params[:origin], params[:destination])

    directions = Directions.new(directions_api_data)

    forecast_data = DarkskyService.new.get_future_forecast(directions.destination_latitude, directions.destination_longitude, arrival_time(directions))

    roadtrip = RoadTrip.new(directions, forecast_data)

    render json: RoadTripSerializer.new(roadtrip)
  end

  private

  def valid_key?
    render json: "Bad credentials", status: 401 unless User.find_by_api_key(params[:api_key])
  end

  def road_trip_params
    params.permit(:origin, :destination)
  end

  def arrival_time(directions)
    (Time.now + directions.travel_time_seconds).to_i
  end
end
