require 'rails_helper'

describe "when a request is made for the forecast" do
  it 'returns a json object with data broken into three sections for the landing page', :vcr do
    VCR.use_cassette("outer") do
      get '/api/v1/forecast?location=denver,co'
    end

    expect(response).to be_successful
    
  end
end
