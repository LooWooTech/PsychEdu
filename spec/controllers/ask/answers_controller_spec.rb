require 'spec_helper'

module Ask
  describe AnswersController do
    describe '#create' do
  
      before :each do
        sign_in
        @question = FactoryGirl.create :question
      end
  
      context 'with valid params' do
        before :each do
          @answer_params = {
            :answer => FactoryGirl.attributes_for(:answer),
            :question_id => @question.id
          }
        end
  
        it 'redirects to the question path' do
          post :create, @answer_params
          expect(response).to redirect_to(@question)
        end
      end
  
      context 'with invalid params' do
        before :each do
          @answer_params = {
            :answer => FactoryGirl.attributes_for(:answer, :content => nil),
            :question_id => @question.id
          }
        end
  
        it 're-renders the `question#show` template' do
          post :create, @answer_params
          expect(response).to render_template('questions/show')
        end
      end
    end
  end
end
