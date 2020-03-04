class ForecastFacade

  def initialize(params)
    @city = params[:location].split(',').first
    @state = params[:location].split(',').last
  end

  def geocode_data
    @geocode_data ||= GoogleMapsService.new.get_coords(@city, @state)
  end

  def coordinates_hash
    geocode_data[:results].first[:geometry][:location]
  end

  def forecast_data
    @forecast_data ||= DarkskyService.new.get_forecast(coordinates_hash[:lat], coordinates_hash[:lng])
  end

  def future_forecast_data
    @future_forecast ||= DarkskyService.new.get_future_forecast(coordinates_hash[:lat], coordinates_hash[:lng], time_at_9pm)
  end

  def current_weather
    CurrentWeather.new(forecast_data, geocode_data)
  end

  def weather_details
    WeatherDetails.new(forecast_data, future_forecast_data)
  end

  def forecast_info
    ForecastInfo.new(forecast_data)
  end

  def time_at_9pm
    Time.now.change(hour: 21).to_i
  end
end
