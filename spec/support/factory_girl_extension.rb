module FactoryGirlExtension
  def shared_admin= admin
    @shared_admin = admin
  end

  def shared_admin
    @shared_admin ||= AdminApp::Admin.first || FactoryGirl.create(:admin)
  end

  def reset_shared_admin
    @shared_admin = nil
  end
end

FactoryGirl.send :extend, FactoryGirlExtension
