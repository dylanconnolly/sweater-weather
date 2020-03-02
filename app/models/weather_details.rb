class WeatherDetails
  attr_reader :today_desc, :feels_like, :humidity, :visibility, :uv_index

  def initialize(darksky_api_data)
    @today_desc = darksky_api_data[:daily][:summary]
    # @tonight_desc = darksky_api_data[:hourly][time_at_9pm.to_s]
    @feels_like = darksky_api_data[:currently][:apparentTemperature]
    @humidity = darksky_api_data[:currently][:humidity]
    @visibility = darksky_api_data[:currently][:visibility]
    @uv_index = darksky_api_data[:currently][:uvIndex]
  end

  # def time_at_9pm
  #   Time.now.change(hour: 21).to_i
  # end
end
