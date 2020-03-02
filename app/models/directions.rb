class Directions
  attr_reader :time_as_string, :time_in_seconds

  def initialize(directions_api_data)
    @time_as_string = directions_api_data[:routes].first[:legs].first[:duration][:text]
    @time_in_seconds = directions_api_data[:routes].first[:legs].first[:duration][:value]
  end
end
