describe AdminApp::Versions::V10::Admins, type: :request do
  include_context 'api request authentication helper methods'

  context 'GET api/v1.0/admins' do
    def dispatch
      get '/admin/api/v1.0/admins'
    end

    it_behaves_like "when user doesn't authenticated"

    context 'when use authenticated' do
      before do
        login_admin
        dispatch
      end

      it_behaves_like 'success response'
    end
  end

  context 'GET api/v1.0/admins/:id' do
    def dispatch
      get "/admin/api/v1.0/admins/#{id}"
    end

    let(:id) { FactoryGirl.shared_admin.id }

    it_behaves_like "when user doesn't authenticated"

    context 'when use authenticated' do
      before do
        login_admin
        dispatch
      end

      it_behaves_like 'success response'
    end
  end

  context 'DELETE api/v1.0/admins/:id' do
    def dispatch
      delete "/admin/api/v1.0/admins/#{id}"
    end

    let(:admin) { create :admin }
    let(:id) { admin.id }

    it_behaves_like "when user doesn't authenticated"

    context 'when use authenticated' do
      let(:admins) { AdminApp::Admin.all }

      before do
        login_admin
        dispatch
      end

      it_behaves_like 'success response'
      specify { expect(admins).not_to include admin }
    end
  end
end
