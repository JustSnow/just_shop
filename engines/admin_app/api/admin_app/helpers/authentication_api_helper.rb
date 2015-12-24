module AdminApp
  module AuthenticationApiHelper
    def authenticated?
      authenticated_by_token?
    end

    def authenticate!
      raise Errors::Unauthorized unless authenticated?
    end

    def current_admin
      @current_admin ||= find_user_by_auth_token
    end

    private

      def authenticated_by_token?
        auth_token.present? and !!current_user
      end

      def auth_token
        params[:auth_token].presence || headers['Authorization'].presence
      end

      def find_user_by_auth_token
        auth_token and current_company.users.find_by_authentication_token(auth_token)
      end

      def ensure_admin!
        raise Errors::Unauthorized unless current_user.admin?
      end
  end
end
