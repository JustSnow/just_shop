module AdminApp
  class User::SessionsController < Devise::SessionsController
    layout 'admin_app/authentification'

    def new
      binding.pry
    end
  end
end
