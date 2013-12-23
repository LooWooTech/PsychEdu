require 'spec_helper'

describe Video do
  subject{ FactoryGirl.create :video }

  it_behaves_like 'having unique attribute in scope', :url, :unit
  it_behaves_like 'learnable child', :unit, :through => :unit_learnings, :as => :video_watchings
end
