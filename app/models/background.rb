class Background
  attr_reader :url

  def initialize(background_api_data)
    @url = background_api_data[:urls][:raw]
  end
end
