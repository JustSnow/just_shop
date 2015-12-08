module AdminApp
  class BaseController < ActionController::Base
    layout 'admin_app/admin'
    before_action :authenticate_admin!
    # TODO add Admin::Pundit
    # include Pundit

    protected

    def authenticate_admin!
      if admin_signed_in?
        super
      else
        redirect_to new_admin_session_path
      end
    end
  end
end
