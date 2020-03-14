class ForecastInfo
  attr_reader :hourly_temps, :daily_forecasts

  def initialize(darksky_api_data)
    @hourly_temps = (0..7).to_a.map do |index|
                      HourlyTemp.new(darksky_api_data, index)
                    end

    @daily_forecasts = (0..4).to_a.map do |index|
                          DailyForecast.new(darksky_api_data, index)
                        end
  end
end
