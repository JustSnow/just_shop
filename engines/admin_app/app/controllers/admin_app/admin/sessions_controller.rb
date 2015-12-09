module AdminApp
  class Admin::SessionsController < Devise::SessionsController
    layout 'admin_app/authentification'
    # override new method for add errors to resource
  end
end
