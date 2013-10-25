require 'spec_helper'

describe QuestionsController do
  before(:each){ login }

  describe '#create' do

    context 'with valid params' do
      before :each do
        @question_params = FactoryGirl.attributes_for(:question)
      end

      it 'saves a question' do
        expect{
          post :create, :question => @question_params
        }.to change(Question, :count).by(1)
      end

      it 'redirect to the question path' do
        post :create, :question => @question_params
        expect(response).to redirect_to(assigns[:question])
      end
    end

    context 'with invalid params' do
      before :each do
        @question_params = FactoryGirl.attributes_for(:question, :title => nil)
      end

      it 'does not save any question' do
        expect{
          post :create, :question => @question_params
        }.to_not change(Question, :count)
      end

      it 're-renders the `new` template' do
        post :create, :question => @question_params
        expect(response).to render_template('new')
      end
    end
  end
end
