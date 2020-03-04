require 'rails_helper'

describe "when a request is made for the forecast" do
  it 'returns a json object with data broken into three sections for the landing page', :vcr do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed.class).to eq(Hash)
  end
end
