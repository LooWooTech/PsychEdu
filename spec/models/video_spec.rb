require 'spec_helper'

describe Video do
  subject{ FactoryGirl.create :video }

  it_behaves_like 'having unique attribute in scope', :url, :chapter_id
end
