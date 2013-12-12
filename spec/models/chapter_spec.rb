require 'spec_helper'

describe Chapter do
  subject{ FactoryGirl.create :chapter }
  it_behaves_like 'having unique attribute in scope', :name, :course_id
end
