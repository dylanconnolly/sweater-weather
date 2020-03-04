class Directions
  attr_reader :travel_time_string, :travel_time_seconds, :origin, :destination, :destination_latitude, :destination_longitude

  def initialize(directions_api_data)
    @travel_time_string = directions_api_data[:routes].first[:legs].first[:duration][:text]
    @travel_time_seconds = directions_api_data[:routes].first[:legs].first[:duration][:value]
    @origin = directions_api_data[:routes].first[:legs].first[:start_address]
    @destination = directions_api_data[:routes].first[:legs].first[:end_address]
    @destination_latitude = directions_api_data[:routes].first[:legs].first[:end_location][:lat]
    @destination_longitude = directions_api_data[:routes].first[:legs].first[:end_location][:lng]
  end
end
