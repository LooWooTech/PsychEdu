require 'spec_helper'

describe Topic do
  subject{ FactoryGirl.create :topic }
  it_behaves_like 'having unique attributes', :name
  it_behaves_like 'requiring attributes', :name
end
