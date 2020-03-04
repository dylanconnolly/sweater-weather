class RoadTrip
  attr_reader :origin, :destination, :travel_time, :arrival_temp, :arrival_summary

  def initialize(directions, arrival_weather_data)
    @origin = directions.origin
    @destination = directions.destination
    @travel_time = directions.travel_time_string
    @arrival_temp = arrival_weather_data[:currently][:temperature]
    @arrival_summary = arrival_weather_data[:currently][:summary]
  end
end
