shared_examples 'requiring attributes' do |*attributes|
  attributes.each do |attribute|
    specify "#{attribute} should exist" do
      subject.__send__ :"#{attribute}=", nil
      expect(subject).to be_invalid, "#{subject.class.name} should be invalid without #{attribute}"
    end
  end
end
