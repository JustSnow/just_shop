module AdminApp
  class Application < Grape::API
    # TODO fix me
    # include ErrorsHandling

    cascade true
    format :json
    default_format :json

    # helpers AuthenticationApiHelper

    mount Versions::V10
  end
end
