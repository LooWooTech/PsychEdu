require 'spec_helper'

describe Account do
  subject{ FactoryGirl.create :account }
  specify{ expect(subject).to be_valid }
  it_behaves_like 'requiring attributes', :username
  it_behaves_like 'having unique attributes', :username
end
