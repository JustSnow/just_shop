module AdminApp
  class Application < Grape::API
    include ErrorsHandling

    cascade true
    format :json
    default_format :json

    content_type :json, 'application/json; charset=utf-8'

    helpers AuthenticationApiHelpers
    helpers CleanParamsHelpers

    before do
      authenticate!
    end

    mount Versions::V10
  end
end
