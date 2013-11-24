require 'spec_helper'

describe Account do
  subject{ FactoryGirl.build :account }
  specify{ expect(subject).to be_valid }
  it_behaves_like 'requiring attributes', :login
end
