require 'rails_helper'

describe 'munchies endpoint' do
  it 'returns a json of weather, travel time, and a restaurant', :vcr do
    VCR.use_cassette('inner') do
      get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'
    end

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(parsed[:type]).to eq("munchie")
    expect(parsed[:attributes][:end_location]).to eq("Pueblo, CO")
    expect(parsed[:attributes][:travel_time]).to eq("1 hour 48 mins")
    expect(parsed[:attributes][:restaurant].class).to eq(Hash)
  end
end
