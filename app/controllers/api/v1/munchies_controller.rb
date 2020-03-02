class Api::V1::MunchiesController < ApplicationController

  def index
    # end_city_state = params[:end].split(',')
    #
    # geocode_end_data = GeocodingService.new.get_coords(end_city_state[0], end_city_state[-1])
    # end_coords = geocode_end_data[:results].first[:geometry][:location]

    geocode_data(params[:end])
    end_coords = create_coords

    # directions = GeocodingService.new.get_directions(params[:start], params[:end])

    directions = create_directions(params[:start], params[:end])

    # forecast_data = DarkskyService.new.get_future_forecast(end_coords[:lat], end_coords[:lng], arrival_time(directions))

    # arrival_weather = CurrentWeather.new(forecast_data, @geocode_data)

    arrival_weather = create_arrival_weather(end_coords, arrival_time(directions))

    restaurant_data = YelpService.new.get_restaurants(params[:end], arrival_time(directions), params[:food])

    restaurant = Restaurant.new(restaurant_data[:businesses].first)

    munchie = Munchie.new(directions, arrival_weather, restaurant)

    render json: MunchieSerializer.new(munchie)
  end

  private

  def arrival_time(directions)
    (Time.now + directions.time_in_seconds).to_i
  end

  def create_directions(start_city, end_city)
    directions = GeocodingService.new.get_directions(start_city, end_city)

    Directions.new(directions)
  end

  def geocode_data(city_and_state)
    city_state_array = city_and_state.split(',')

    @geocode_data ||= GeocodingService.new.get_coords(city_state_array[0], city_state_array[-1])
  end

  def create_coords
    @geocode_data[:results].first[:geometry][:location]
  end

  def create_arrival_weather(coords, time_of_arrival)
    forecast_data = DarkskyService.new.get_future_forecast(coords[:lat], coords[:lng], time_of_arrival)

    CurrentWeather.new(forecast_data, @geocode_data)
  end
end
