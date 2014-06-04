require 'spec_helper'

module Admin
  describe StudentsController do
    before do
      sign_in_as_administrator
    end

    describe '#create' do
      before do
        @student_attributes = {
          :student => FactoryGirl.attributes_for(:student).merge(
            :account_attributes => FactoryGirl.attributes_for(:account)
          )
        }
      end

      it 'redirects to the show page of the student' do
        post :create, @student_attributes
        expect(response).to redirect_to([:admin, assigns[:student]])
      end

      context 'when fail' do
        before do
          @student_attributes[:student][:name] = ''
        end

        it 're-renders the `new` template' do
          post :create, @student_attributes
          expect(response).to render_template(:new)
        end
      end
    end
  end
end
