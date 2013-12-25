require 'spec_helper'

describe UnitLearning do
  subject{ FactoryGirl.create :unit_learning }
  include_examples 'auto create child learning objects', :video_watchings, :for => :video, :parent => :unit
end
