require 'spec_helper'

describe Unit do
  subject{ FactoryGirl.create :unit }
  it_behaves_like 'having unique attribute in scope', :name, :chapter
  it_behaves_like 'learnable child', :chapter, :through => :chapter_learnings, :as => :unit_learnings
end
