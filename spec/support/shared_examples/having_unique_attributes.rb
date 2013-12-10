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
  specify "#{attribute} must be unique with the same #{scope}" do
    expect(model_with_the_same_attribute(attribute, scope)).to be_invalid
  end

  specify "#{attribute} could not be unique with different #{scope}" do
    expect(model_with_the_same_attribute(attribute)).to be_valid
  end
end
