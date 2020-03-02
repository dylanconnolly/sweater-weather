class Api::V1::MunchiesController < ApplicationController

  def index
    # start_city_state = params[:start].split(',')
    end_city_state = params[:end].split(',')
    food = params[:food]

    # geocode_start_data = GeocodingService.new.get_coords(start_city_state[0], start_city_state[-1])
    geocode_end_data = GeocodingService.new.get_coords(end_city_state[0], end_city_state[-1])
    end_coords = geocode_end_data[:results].first[:geometry][:location]

    directions = GeocodingService.new.get_directions(params[:start], params[:end])

    travel_time = Directions.new(directions)

    forecast_data = DarkskyService.new.get_future_forecast(end_coords[:lat], end_coords[:lng], (Time.now + travel_time.time_in_seconds).to_i)

    arrival_weather = CurrentWeather.new(forecast_data, geocode_end_data)

    
  end
end
