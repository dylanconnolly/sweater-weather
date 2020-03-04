require 'rails_helper'

describe 'when a post request containing a users email, password, and pw confirmation is made to /users' do
  it 'a user is created and saved to the db and a response is sent containing an api_key' do
    request_body = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: request_body

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes].keys.first).to eq(:api_key)
  end

  it 'an error response is sent back with a 400 level status code if email is not unique or passwords dont match' do
    request_body = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password_doesnt_match"
    }

    post '/api/v1/users', params: request_body

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(parsed[:status]).to eq(401)
    expect(parsed[:errors]).to eq(["Password confirmation doesn't match Password"])

    ### fields can't be blank ###

    request_body = {
      email: "",
      password: "",
      password_confirmation: ""
    }

    post '/api/v1/users', params: request_body

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(parsed[:status]).to eq(401)
    expect(parsed[:errors]).to eq(["Email can't be blank",
                                    "Password can't be blank",
                                    "Password can't be blank"
                                  ])
  end
end
