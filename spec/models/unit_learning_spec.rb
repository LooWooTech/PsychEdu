require 'spec_helper'

describe UnitLearning do
  subject{ FactoryGirl.create :unit_learning }
  it_behaves_like 'composing with model that have the same parent object', :course_learning, :course
end
