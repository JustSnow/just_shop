module AdminApp
  class User::SessionsController < Devise::SessionsController
    layout 'admin_app/authentification'

    def new
      @admin_model = AdminApp::User
      super
    end
  end
end
