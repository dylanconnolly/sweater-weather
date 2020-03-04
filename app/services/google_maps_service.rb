class GoogleMapsService

  def connection
    Faraday.new("https://maps.googleapis.com/maps/api/") do |f|
    end
  end

  def get_json(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_coords(city, state)
    get_json("geocode/json?components=locality:#{city}|administrative_area:#{state}&key=#{ENV['GOOGLE_API_KEY']}")
  end

  def get_directions(origin, destination)
    get_json("directions/json?origin=#{origin}&destination=#{destination}&key=#{ENV['GOOGLE_API_KEY']}")
  end
end
