require 'rails_helper'

describe 'DarkskyService' do
  it 'returns a hash of the forecast for a given latitude and longitude', :vcr do

    service = DarkskyService.new

    response = service.get_forecast('39.7392358','-104.990251')

    expect(response.class).to eq(Hash)
    expect(response[:timezone]).to eq('America/Denver')
  end
end
