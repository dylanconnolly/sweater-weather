require 'rails_helper'

describe "Google geocoding api service" do
  it "can be given a city name and state and return latitude and longitude for that location", :vcr do

    service = GoogleMapsService.new
    response = service.get_coords("denver", "co")

    expect(response.class).to eq(Hash)
    expect(response[:results].first[:formatted_address]).to eq("Denver, CO, USA")
  end
end
