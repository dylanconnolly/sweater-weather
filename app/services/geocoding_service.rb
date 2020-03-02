class GeocodingService

  def connection
    Faraday.new("https://maps.googleapis.com/maps/api/geocode/json") do |f|
    end
  end

  def get_json(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_coords(city, state)
    location_data = get_json("?components=locality:#{city}|administrative_area:#{state}&key=#{ENV['GEOCODING_API_KEY']}")
  end
end
