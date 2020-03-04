class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id { "null" }

  attributes :road_trip
end
