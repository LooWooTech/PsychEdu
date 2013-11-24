require 'spec_helper'

describe Answer do
  subject{ FactoryGirl.build :answer}

  specify{ expect(subject).to be_valid }

  it_behaves_like 'requiring attributes', :content

end
