class GeocodingService

  def connection
    Faraday.new("https://maps.googleapis.com/maps/api/") do |f|
    end
  end

  def get_json(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_coords(city, state)
    location_data = get_json("geocode/json?components=locality:#{city}|administrative_area:#{state}&key=#{ENV['GEOCODING_API_KEY']}")
  end

  def get_directions(origin, destination)
    directions = get_json("directions/json?origin=#{origin}&destination=#{destination}&key=#{ENV['GEOCODING_API_KEY']}")
  end

  private

  def travel_time
    [:routes].first[:legs].first[:duration]
  end
end
