RSpec.shared_context 'api request authentication helper methods' do
  def login_admin
    login_as FactoryGirl.shared_admin, scope: :admin
  end

  def sign_out_admin
    logout :admin
  end
end
