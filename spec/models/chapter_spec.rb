require 'spec_helper'

describe Chapter do
  subject{ FactoryGirl.create :chapter }
  it_behaves_like 'having unique attribute in scope', :name, :topic
  it_behaves_like 'requiring attributes', :name
  it_behaves_like 'learnable child', :topic, :through => :topic_learnings, :as => :chapter_learnings
end
