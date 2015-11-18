module AdminApp
  class BaseController < ActionController::Base
    layout 'admin_app/admin'
    before_filter :authenticate_admin_user!
    # TODO add Admin::Pundit
    include Pundit

    protected

    def authenticate_admin_user!
      if admin_user_signed_in?
        super
      else
        redirect_to login_path
      end
    end
  end
end
