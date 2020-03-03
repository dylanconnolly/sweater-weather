class Api::V1::BackgroundsController < ApplicationController

  def index
    city = params["location"].split(',').first

    photo_data = BackgroundsService.new.get_photo(city)

    render json: BackgroundSerializer.new(Background.new(photo_data))
  end
end
