shared_examples 'composing with model that have the same parent object' do |component_name, parent_name|
  specify "the #{component_name} must have the same #{parent_name} with #{described_class.name.underscore}" do
    component = FactoryGirl.create component_name, parent_name => FactoryGirl.create(parent_name)
    subject.__send__("#{component_name}=", component)
    expect(subject).to be_invalid
  end
end
