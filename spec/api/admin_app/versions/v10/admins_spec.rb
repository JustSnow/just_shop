describe AdminApp::Versions::V10::Admins, type: :request do
  include_context 'api request authentication helper methods'

  def dispatch
    get "/admin/api/v1.0/#{request_path}"
  end

  context 'GET api/v1.0/admins' do
    let(:request_path) { 'admins' }

    before { dispatch }

    context "when user doesn't authenticated" do
      specify { expect(response.status).to eq(401) }
    end

    context 'when use authenticated' do
      before { login_admin }

      # TODO fix me
      specify { expect(response).to be_success }
    end
  end
end
