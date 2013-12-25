require 'spec_helper'

describe Subject do
  subject{ FactoryGirl.create :subject }
  it_behaves_like 'having unique attributes', :name
  it_behaves_like 'requiring attributes', :name
end
