require 'spec_helper'

describe Unit do
  subject{ FactoryGirl.create :unit }
  it_behaves_like 'having unique attribute in scope', :name, :course_id
end
