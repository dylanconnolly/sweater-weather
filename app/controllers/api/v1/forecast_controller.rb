class Api::V1::ForecastController < ApplicationController

  def index
    city_state = params["location"].split(',')

    city = city_state.first
    state = city_state.last

    geocode_data = GeocodingService.new.get_coords(city, state)

    coords = geocode_data[:results].first[:geometry][:location]

    forecast_data = DarkskyService.new.get_forecast(coords[:lat], coords[:lng])


    current_weather = CurrentWeather.new(forecast_data, geocode_data)
    weather_details = WeatherDetails.new(forecast_data)
    forecast = Forecast.new(forecast_data)
    require "pry"; binding.pry
    render json: ForecastSerializer.new([current_weather, weather_details, forecast])
  end
end
