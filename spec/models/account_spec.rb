require 'spec_helper'

describe Account do
  subject{ FactoryGirl.create :account }
  specify{ expect(subject).to be_valid }
  it_behaves_like 'requiring attributes', :login
  it_behaves_like 'having unique attributes', :login
end
