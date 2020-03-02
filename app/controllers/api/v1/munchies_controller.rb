class Api::V1::MunchiesController < ApplicationController

  def index
    geocode_data(params[:end])
    end_coords = create_coords

    directions = create_directions(params[:start], params[:end])

    arrival_weather = create_arrival_weather(end_coords, arrival_time(directions))

    restaurant = create_restaurant(params[:end], arrival_time(directions), params[:food])

    render json: MunchieSerializer.new(Munchie.new(directions, arrival_weather, restaurant))
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

  def create_restaurant(city, time, food_type)
    restaurant_data = YelpService.new.get_restaurants(city, time, food_type)

    Restaurant.new(restaurant_data[:businesses].first)
  end
end
