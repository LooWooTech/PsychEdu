require 'spec_helper'

describe TopicTesting do
  subject { FactoryGirl.create :topic_testing }
  it_behaves_like 'having unique attributes', :topic
  it_behaves_like 'requiring attributes', :topic_id, :title
end
