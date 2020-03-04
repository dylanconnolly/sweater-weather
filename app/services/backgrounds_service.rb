class BackgroundsService

  def connection
    Faraday.new('https://api.unsplash.com/') do |f|
      f.headers["Authorization"] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
    end
  end

  def get_json(uri)
    response = connection.get(uri)

    JSON.parse(response.body, symbolize_names: true)
  end

  def get_photo(subject)
    get_json("photos/random?query=#{subject}")
  end
end
