require 'spec_helper'

describe Administrator do
  subject{ FactoryGirl.build :administrator }

  specify { expect(subject).to be_valid }

  it_behaves_like('having an account')
end
