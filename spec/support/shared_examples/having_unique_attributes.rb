def model_with_the_same_attribute(attribute, scope=nil)
  factory_name = described_class.name.underscore
  if scope
    FactoryGirl.build(factory_name, attribute => subject.__send__(attribute), scope => subject.__send__(scope))
  else
    FactoryGirl.build(factory_name, attribute => subject.__send__(attribute))
  end
end

shared_examples 'having unique attributes' do |*attributes|
  attributes.each do |attribute|
    specify attribute do
      expect(model_with_the_same_attribute(attribute)).to be_invalid
    end
  end
end

shared_examples 'having unique attribute in scope' do |attribute, scope|
  context "#{described_class.name} with #{scope}" do
    before do
      subject.update_attribute scope, FactoryGirl.create(scope)
    end

    specify "#{attribute} must be unique in the same #{scope}" do
      expect(model_with_the_same_attribute(attribute, scope)).to be_invalid
    end

    specify "#{attribute} can be the same with different #{scope}" do
      expect(model_with_the_same_attribute(attribute)).to be_valid
    end
  end
end
