require 'spec_helper'

describe Student do
  subject{FactoryGirl.build :student}
  specify {expect(subject).to be_valid}

  it_behaves_like 'requiring attributes', :name, :gender, :unit_code
  it_behaves_like 'having an account'
end
