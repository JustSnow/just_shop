module AdminApp
  class Admin::SessionsController < Devise::SessionsController
    layout 'admin_app/authentification'
  end
end
