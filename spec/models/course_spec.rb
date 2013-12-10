require 'spec_helper'

describe Course do
  subject{ FactoryGirl.create :course }
  it_behaves_like 'having unique attribute in scope', :name, :subject_id
  it_behaves_like 'requiring attributes', :name
end
