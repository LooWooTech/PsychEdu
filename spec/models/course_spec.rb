require 'spec_helper'

describe Course do
  subject{ FactoryGirl.create :course }
  it_behaves_like 'having unique attribute in scope', :name, :topic
  it_behaves_like 'requiring attributes', :name
  it_behaves_like 'learnable child', :topic, :through => :topic_learnings, :as => :course_learnings
end
