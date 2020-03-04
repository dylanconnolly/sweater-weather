class RoadTripFacade

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
  end

  def directions_api_data
    @directions_api_data ||= GoogleMapsService.new.get_directions(@origin, @destination)
  end

  def forecast_data
    @forecast_data = DarkskyService.new.get_future_forecast(@directions.destination_latitude, @directions.destination_longitude, arrival_time)
  end

  def directions
    @directions ||= Directions.new(directions_api_data)
  end

  def arrival_time
    (Time.now + @directions.travel_time_seconds).to_i
  end

  def road_trip
    RoadTrip.new(directions, forecast_data)
  end
end
