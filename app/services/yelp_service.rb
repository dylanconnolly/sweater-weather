class YelpService

  def connection
    Faraday.new("https://api.yelp.com/v3/") do |f|
      f.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
    end
  end

  def get_json(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_restaurants(latitude, longitude, type)
    get_json("businesses/search?latitude=#{latitude}&longitude=#{longitude}&category=#{type}")
  end
end
