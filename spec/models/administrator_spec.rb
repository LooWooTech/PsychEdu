require 'spec_helper'

describe Administrator do
  before :each do
    @administrator = FactoryGirl.create :administrator
  end

  specify { expect(@administrator).to be_valid }

  specify 'login should exist' do
    @administrator.login = ''
    expect(@administrator).to be_invalid
  end

  describe '.authenticate' do
    it 'returns the administrator if authenticate passed' do
      expect(Administrator.authenticate @administrator.login, @administrator.password).to eq(@administrator)
    end

    it 'returns false if login name does not exist' do
      expect(Administrator.authenticate 'no_exist_login_name', @administrator.password).to be_false
    end
    it 'returns false if password is wrong' do
      expect(Administrator.authenticate @administrator.login, 'wrong_password').to be_false
    end
  end
end
