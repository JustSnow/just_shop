describe AdminApp::Admin do
  describe '#name' do
    let(:first_name) { 'first' }
    let(:last_name) { 'second' }
    let(:admin) { create :admin, first_name: first_name, last_name: last_name }
    let(:expected_name) { 'first second' }

    subject { admin.name }

    specify { is_expected.to eq expected_name }

    context 'when something from first or last names are empty' do
      let(:first_name) { '' }
      let(:expected_name) { 'second' }

      specify { is_expected.to eq expected_name }
    end

    context 'when user did not fill first and last names' do
      let(:first_name) { '' }
      let(:last_name) { '' }
      let(:expected_name) { admin.email }

      specify { is_expected.to eq expected_name }
    end
  end
end
