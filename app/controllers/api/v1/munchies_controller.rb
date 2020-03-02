class Api::V1::MunchiesController < ApplicationController

  def index
    start_city_state = params[:start].split(',')
    end_city_state = params[:end].split(',')
    food = params[:food]

    geocode_start_data = GeocodingService.new.get_coords(start_city_state[0], start_city_state[-1])
    geocode_end_data = GeocodingService.new.get_coords(end_city_state[0], end_city_state[-1])

    directions = GeocodingService.new.get_directions(params[:start], params[:end])

    travel_time_hash = directions[:routes].first[:legs].first[:duration]

    forecast_data = DarkskyService.new.
  end
end
