class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id { 'null' }

  attributes :url
end
