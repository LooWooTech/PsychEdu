shared_examples 'having unique attributes' do |*attributes|
  attributes.each do |attribute|
    specify attribute do
      factory_name = described_class.name.underscore
      new_model = FactoryGirl.build(factory_name, attribute => subject.__send__(attribute))
      expect(new_model).to be_invalid
    end
  end
end
