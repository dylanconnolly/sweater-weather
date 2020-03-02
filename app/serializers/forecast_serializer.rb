class ForecastSerializer
  attr_reader :current_weather, :weather_details, :forecast

  def initialize(objects)
    @current_weather = CurrentWeatherSerializer.new(objects[0])
    @weather_details = WeatherDetailsSerializer.new(objects[1])
    @forecast_info = ForecastInfoSerializer.new(objects[2])
  end



  # include FastJsonapi::ObjectSerializer
  #
  # set_id {"null"}
  #
  # meta do |current_weather|
  #   require "pry"; binding.pry
  #   {
  #     current_weather: CurrentWeatherSerializer.new(current_weather)
  #   }
  # end
  #
  # meta do |weather_details|
  #   {
  #     weather_details: WeatherDetailsSerializer.new(weather_details)
  #   }
  # end
  #
  # meta do |forecast_info|
  #   {
  #     forecast_info: ForecastInfoSerializer.new(forecast_info)
  #   }
  # end
end
