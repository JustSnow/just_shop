shared_examples_for "when user doesn't authenticated" do
  context "when user doesn't authenticated" do
    before { dispatch }

    it_behaves_like 'unauthorized response'
  end
end
