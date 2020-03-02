class CurrentWeather
  attr_reader :time, :summary, :icon, :temperature, :high_temp, :low_temp, :city, :state, :country

  def initialize(darksky_api_data, geocode_api_data)
    @time = Time.at(darksky_api_data[:currently][:time])
    @summary = darksky_api_data[:currently][:summary]
    @icon = darksky_api_data[:currently][:icon]
    @temperature = darksky_api_data[:currently][:temperature]
    @high_temp = darksky_api_data[:daily][:data].first[:temperatureHigh]
    @low_temp = darksky_api_data[:daily][:data].first[:temperatureLow]
    @city = geocode_api_data[:results].first[:address_components].first[:short_name]
    @state = geocode_api_data[:results].first[:address_components][-2][:short_name]
    @country = geocode_api_data[:results].first[:address_components][-1][:long_name]
  end
end
