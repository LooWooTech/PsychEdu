shared_examples 'having an account' do
  specify 'account should exist' do
    subject.account = nil
    expect(subject).to be_invalid, "#{subject.class.name} should be invalid without an account"
  end
end
