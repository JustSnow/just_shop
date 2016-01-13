describe AdminApp::Versions::V10::Admins, type: :request do
  include_context 'api request authentication helper methods'

  context 'GET api/v1.0/admins' do
    def dispatch
      get '/admin/api/v1.0/admins'
    end

    context "when user doesn't authenticated" do
      before { dispatch }

      it_behaves_like 'unauthorized response'
    end

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

    context "when user doesn't authenticated" do
      before { dispatch }

      it_behaves_like 'unauthorized response'
    end

    context 'when use authenticated' do
      before do
        login_admin
        dispatch
      end

      it_behaves_like 'success response'
    end
  end
end
