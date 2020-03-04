class WeatherDetails
  attr_reader :today_desc, :tonight_desc, :feels_like, :humidity, :visibility, :uv_index

  def initialize(darksky_api_data, future_forecast_data)
    @today_desc = darksky_api_data[:daily][:summary]
    @tonight_desc = future_forecast_data[:currently][:summary]
    @feels_like = darksky_api_data[:currently][:apparentTemperature]
    @humidity = darksky_api_data[:currently][:humidity]
    @visibility = darksky_api_data[:currently][:visibility]
    @uv_index = darksky_api_data[:currently][:uvIndex]
  end
end
