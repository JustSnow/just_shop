module AdminApp
  class Versions::V10 < Grape::API
    version 'v1.0', using: :path, parameter: 'v'

    mount Versions::V10::Admins
  end
end
