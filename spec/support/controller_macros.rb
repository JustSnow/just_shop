module ControllerMacros
  def login_admin
    before :each do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      sign_in FactoryGirl.shared_admin
    end
  end
end
