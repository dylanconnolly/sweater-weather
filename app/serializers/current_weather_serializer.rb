class CurrentWeatherSerializer
  include FastJsonapi::ObjectSerializer
    set_id {"null"}

    attributes :time, :summary, :icon, :temperature, :high_temp, :low_temp, :city, :state, :country
end
