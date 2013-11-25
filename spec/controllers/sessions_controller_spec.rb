require 'spec_helper'

describe SessionsController do
  describe '#create' do
    context 'sign in as an administrator' do
      before :each do
        @administrator = FactoryGirl.create :administrator
      end

      context 'when success' do
        before :each do
          post :create, {:username => @administrator.username, :password => @administrator.password}
        end

        it 'redirects to root path of admin' do
          expect(response).to redirect_to(admin_url)
        end
      end

      context 'when fail' do
        before :each do
          post :create, {:username => @administrator.username, :password => 'wrong password'}
        end

        it 'renders the `new` template' do
          expect(response).to render_template('new')
        end
      end
    end
  end
end
