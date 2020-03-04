require 'rails_helper'

describe 'when a post request is made to /roadtrip' do
  it 'a road trip json is returned if a valid api key was provided in the request', :vcr do

    user = User.create(email: "whatever@example.com", password: "password", api_key: "supersafeapikey")

    allow(Time).to receive(:now).and_return(Time.parse('Wed, 04 Mar 2020 15:17:38 GMT'))

    request_body = {
                      "origin": "Denver,CO",
                      "destination": "Pueblo,CO",
                      "api_key": "supersafeapikey"
                    }

    post '/api/v1/road_trip', params: request_body

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes][:origin]).to eq("Denver, CO, USA")
    expect(parsed[:data][:attributes][:destination]).to eq("Pueblo, CO, USA")
    expect(parsed[:data][:attributes][:travel_time]).to eq("1 hour 48 mins")
  end
end
