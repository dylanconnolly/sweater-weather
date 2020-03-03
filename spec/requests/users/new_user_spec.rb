require 'rails_helper'

describe 'when a post request containing a users email, password, and pw confirmation is made to /users' do
  it 'a user is created and saved to the db and a response is sent containing an api_key' do
    # stub_request(:post, "/api/v1/users").with(body:
    #   { "email": "whatever@example.com",
    #     "password": "password",
    #     "password_confirmation": "password"
    #   }
    # )

    # expect_any_instance_of(Net::HTTP::Post).to receive(:request) {
    #   { "email": "whatever@example.com",
    #   "password": "password",
    #   "password_confirmation": "password"
    #   }
    # }

    request_body = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post '/api/v1/users', params: request_body


  end
end
