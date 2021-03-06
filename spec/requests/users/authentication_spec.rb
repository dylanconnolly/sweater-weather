require 'rails_helper'

describe 'when a post request containing an email and password is sent to /sessions' do
  it 'if the email and password are successfully authenticated a response is sent containing that users api_key' do

    user = User.create(email: "whatever@example.com", password: "password", api_key: "This_is_a_made_up_api_key")

    request_body = {
      email: "whatever@example.com",
      password: "password"
    }

    post '/api/v1/sessions', params: request_body

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)

    expect(parsed[:data][:attributes][:api_key]).to eq("This_is_a_made_up_api_key")
  end

  it 'if the email and password are not authenticated, a 401 response is sent' do
    user = User.create(email: "whatever@example.com", password: "password", api_key: "This_is_a_made_up_api_key")

    request_body = {
      email: "whatever@example.com",
      password: "thisdoesntmatch"
    }

    post '/api/v1/sessions', params: request_body

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(parsed).to eq({errors: "Credentials are bad."})
  end
end
