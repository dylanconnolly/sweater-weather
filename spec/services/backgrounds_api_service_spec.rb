require 'rails_helper'

describe "Backgrounds image api service" do
  it "can be given a city name and state and return a json object with an image url", :vcr do

    service = BackgroundsService.new
    response = service.get_photo("denver")

    expect(response.class).to eq(Hash)
    expect(response[:urls][:raw].class).to eq(String)
  end
end
