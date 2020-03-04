class Api::V1::ForecastController < ApplicationController

  def index
    city_state = params["location"].split(',')

    city = city_state.first
    state = city_state.last

    geocode_data = GoogleMapsService.new.get_coords(city, state)

    coords = geocode_data[:results].first[:geometry][:location]

    forecast_data = DarkskyService.new.get_forecast(coords[:lat], coords[:lng])

    future_forecast_data = DarkskyService.new.get_future_forecast(coords[:lat], coords[:lng], time_at_9pm)

    current_weather = CurrentWeather.new(forecast_data, geocode_data)
    weather_details = WeatherDetails.new(forecast_data, future_forecast_data)
    forecast_info = ForecastInfo.new(forecast_data)
    
    render json: ForecastSerializer.new([current_weather, weather_details, forecast_info])
  end

  private

  def time_at_9pm
      Time.now.change(hour: 21).to_i
  end
end
