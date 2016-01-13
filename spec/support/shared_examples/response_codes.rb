shared_examples_for 'unauthorized response' do
  specify { expect(response.status).to eq(401) }
end

shared_examples_for 'success response' do
  specify { expect(response).to be_success }
end
