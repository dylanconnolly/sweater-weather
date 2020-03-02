class ForecastInfo
  attr_reader :hourly_temps, :daily_forecasts

  def initialize(darksky_api_data)
    @hourly_temps = {
      Time.at(darksky_api_data[:hourly][:data][0][:time]) => darksky_api_data[:hourly][:data][0][:temperature],
      Time.at(darksky_api_data[:hourly][:data][1][:time]) => darksky_api_data[:hourly][:data][1][:temperature],
      Time.at(darksky_api_data[:hourly][:data][2][:time]) => darksky_api_data[:hourly][:data][2][:temperature],
      Time.at(darksky_api_data[:hourly][:data][3][:time]) => darksky_api_data[:hourly][:data][3][:temperature],
      Time.at(darksky_api_data[:hourly][:data][4][:time]) => darksky_api_data[:hourly][:data][4][:temperature],
      Time.at(darksky_api_data[:hourly][:data][5][:time]) => darksky_api_data[:hourly][:data][5][:temperature],
      Time.at(darksky_api_data[:hourly][:data][6][:time]) => darksky_api_data[:hourly][:data][6][:temperature],
      Time.at(darksky_api_data[:hourly][:data][7][:time]) => darksky_api_data[:hourly][:data][7][:temperature],
    }
    @daily_forecasts = {
      Time.at(darksky_api_data[:daily][:data][0][:time]).strftime('%A') => {
        :icon => darksky_api_data[:daily][:data][0][:icon],
        :precip_probability => darksky_api_data[:daily][:data][0][:precipProbability],
        :high_temp => darksky_api_data[:daily][:data][0][:temperatureHigh],
        :low_temp => darksky_api_data[:daily][:data][0][:temperatureLow]
      },
      Time.at(darksky_api_data[:daily][:data][1][:time]).strftime('%A') => {
        :icon => darksky_api_data[:daily][:data][1][:icon],
        :precip_probability => darksky_api_data[:daily][:data][1][:precipProbability],
        :high_temp => darksky_api_data[:daily][:data][1][:temperatureHigh],
        :low_temp => darksky_api_data[:daily][:data][1][:temperatureLow]
      },
      Time.at(darksky_api_data[:daily][:data][2][:time]).strftime('%A') => {
        :icon => darksky_api_data[:daily][:data][2][:icon],
        :precip_probability => darksky_api_data[:daily][:data][2][:precipProbability],
        :high_temp => darksky_api_data[:daily][:data][2][:temperatureHigh],
        :low_temp => darksky_api_data[:daily][:data][2][:temperatureLow]
      },
      Time.at(darksky_api_data[:daily][:data][3][:time]).strftime('%A') => {
        :icon => darksky_api_data[:daily][:data][3][:icon],
        :precip_probability => darksky_api_data[:daily][:data][3][:precipProbability],
        :high_temp => darksky_api_data[:daily][:data][3][:temperatureHigh],
        :low_temp => darksky_api_data[:daily][:data][3][:temperatureLow]
      },
      Time.at(darksky_api_data[:daily][:data][4][:time]).strftime('%A') => {
        :icon => darksky_api_data[:daily][:data][4][:icon],
        :precip_probability => darksky_api_data[:daily][:data][4][:precipProbability],
        :high_temp => darksky_api_data[:daily][:data][4][:temperatureHigh],
        :low_temp => darksky_api_data[:daily][:data][4][:temperatureLow]
      }
    }
  end
end
