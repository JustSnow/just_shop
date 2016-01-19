module ControllerMacros
  def login_admin admin = FactoryGirl.shared_admin
    before :each do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in admin
    end
  end
end
