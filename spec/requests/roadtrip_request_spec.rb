require 'rails_helper'

describe 'when a post request is made to /roadtrip' do
  it 'a road trip json is returned if a valid api key was provided in the request' do

    user = User.create(email: "whatever@example.com", password: "password", api_key: "supersafeapikey")

    request_body = {
                      "origin": "Denver,CO",
                      "destination": "Pueblo,CO",
                      "api_key": "supersafeapikey"
                    }

    post '/api/v1/road_trip', params: request_body

    
  end
end
