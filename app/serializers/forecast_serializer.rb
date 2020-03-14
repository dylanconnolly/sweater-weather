class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  set_id {"null"}

  attributes :current_weather, :weather_details, :forecast_info
end
