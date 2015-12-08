module AdminApp
  class Admin::SessionsController < Devise::SessionsController
    layout 'admin_app/authentification'

    def new
      @admin_model = AdminApp::Admin
      super
    end
  end
end
