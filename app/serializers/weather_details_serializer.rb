class WeatherDetailsSerializer
  include FastJsonapi::ObjectSerializer
    set_id {"null"}

    attributes :today_desc, :tonight_desc, :feels_like, :humidity, :visibility, :uv_index
end
