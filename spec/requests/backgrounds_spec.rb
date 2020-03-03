require 'rails_helper'

describe "when a request is made for a background image" do
  it 'a json object is returned with an image url', :vcr do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    
    expect(parsed.class).to eq(Hash)
    expect(parsed[:data][:attributes][:url]).to include('https://images.unsplash')
  end
end
