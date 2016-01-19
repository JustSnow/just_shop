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

  context 'POST api/v1.0/admins' do
    def dispatch
      post '/admin/api/v1.0/admins', params
    end

    let(:params) { {} }

    it_behaves_like "when user doesn't authenticated"

    context 'when use authenticated' do
      let(:email) { Faker::Internet.free_email }
      let :params do
        {
          admin: {
            email: email,
            password: '12345678',
            password_confirmation: '12345678',
            first_name: Faker::Name.first_name
          }
        }
      end

      before do
        login_admin
        dispatch
      end

      it_behaves_like 'success response'
      specify { expect(AdminApp::Admin.pluck(:email)).to include email }

      context "when admin's data doesn't valid" do
        let :params do
          {
            admin: {
              email: email,
              password: '12345678',
              password_confirmation: '123456781',
              first_name: Faker::Name.first_name
            }
          }
        end

        it_behaves_like 'record invalid'
      end
    end
  end

  context 'PUT api/v1.0/admins/:id' do
    def dispatch
      put "/admin/api/v1.0/admins/#{id}", params
    end

    let(:params) { {} }
    let(:admin) { create :admin }
    let(:id) { admin.id }

    it_behaves_like "when user doesn't authenticated"
  end
end
