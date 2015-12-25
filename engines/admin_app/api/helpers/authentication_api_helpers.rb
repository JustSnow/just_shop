module AuthenticationApiHelpers
  def authenticated?
    warden.authenticated?
  end

  def authenticate!
    raise Errors::Unauthorized unless authenticated?
  end

  def current_admin
    @current_admin ||= warden.user
  end

  private

  def warden
    @warden ||= env['warden']
  end
end
