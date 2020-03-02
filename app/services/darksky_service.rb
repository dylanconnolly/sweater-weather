class DarkskyService

  def connection
    Faraday.new("https://api.darksky.net/forecast/#{ENV['DARKSKY_API_KEY']}/") do |f|
    end
  end

  def get_json(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_forecast(latitude, longitude)
    get_json("#{latitude},#{longitude}")
  end

end
