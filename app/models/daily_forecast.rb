class DailyForecast

  def initialize(darksky_api_data, index)
    @day = Time.at(darksky_api_data[:daily][:data][index][:time]).strftime('%A')
    @icon = darksky_api_data[:daily][:data][index][:icon]
    @precip_probability = darksky_api_data[:daily][:data][index][:precipProbability]
    @high_temp = darksky_api_data[:daily][:data][index][:temperatureHigh]
    @low_temp = darksky_api_data[:daily][:data][index][:temperatureLow]
  end
end
