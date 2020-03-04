class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id { "null" }

  attributes :origin, :destination, :travel_time, :arrival_temp, :arrival_summary
end
