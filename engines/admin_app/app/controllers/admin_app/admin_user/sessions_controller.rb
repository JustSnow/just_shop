module AdminApp
  module AdminUser
    class Sessions < Devise::SessionsController
      layout 'admin_app/authentification'
    end
  end
end
