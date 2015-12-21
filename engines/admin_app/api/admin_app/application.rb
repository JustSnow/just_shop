module AdminApp
  class Application < Grape::API
    cascade true
    format :json
    default_format :json
    mount Versions::V10
  end
end
