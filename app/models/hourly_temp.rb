class HourlyTemp

  def initialize(darksky_api_data, index)
    @time = Time.at(darksky_api_data[:hourly][:data][index][:time])
    @temperature = darksky_api_data[:hourly][:data][index][:temperature]
  end
end
