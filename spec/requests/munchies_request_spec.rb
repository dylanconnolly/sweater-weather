require 'rails_helper'

describe 'munchies endpoint' do
  it 'returns a json of weather, travel time, and a restaurant', :vcr do

    get '/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese'

  end
end
