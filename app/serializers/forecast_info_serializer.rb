class ForecastInfoSerializer
  include FastJsonapi::ObjectSerializer
    set_id {"null"}

    attributes :hourly_temps, :daily_forecasts
end
