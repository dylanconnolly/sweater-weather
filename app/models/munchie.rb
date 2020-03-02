class Munchie
  attr_reader :end_location, :travel_time, :forecast, :restaurant

  def initialize(directions, current_weather, restaurant)
    @end_location = current_weather.city + ', ' + current_weather.state
    @travel_time = directions.time_as_string
    @forecast = current_weather.summary
    @restaurant = restaurant
  end
end
