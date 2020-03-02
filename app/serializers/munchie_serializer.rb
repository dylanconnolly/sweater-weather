class MunchieSerializer
  include FastJsonapi::ObjectSerializer

  set_id {'null'}

  attributes :end_location, :travel_time, :forecast, :restaurant
  # attribute :end_location do |object|
  #   object.end_location
  # end
end
