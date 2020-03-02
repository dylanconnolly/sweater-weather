class Restaurant
  attr_reader :name, :address

  def initialize(yelp_restaurant_data)
    @name = yelp_restaurant_data[:name]
    @address = yelp_restaurant_data[:location][:display_address].join(', ')
  end
end
