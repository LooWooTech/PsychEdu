require 'spec_helper'

module Ask
  describe QuestionsController do
    before do
      sign_in
      @forum = FactoryGirl.create :forum
    end
  
    describe '#create' do
  
      context 'with valid params' do
        before do
          @question_params = {:question => FactoryGirl.attributes_for(:question), :forum_id => @forum.id}
        end
  
        it 'saves a question' do
          expect{
            post :create, @question_params
          }.to change(Question, :count).by(1)
        end
  
        it 'redirect to the question path' do
          post :create, @question_params
          expect(response).to redirect_to([:ask, assigns[:question]])
        end
      end
  
      context 'with invalid params' do
        before do
          @question_params = {:question => FactoryGirl.attributes_for(:question, :title => nil), :forum_id => @forum.id}
        end
  
        it 'does not save any question' do
          expect{
            post :create, @question_params
          }.to_not change(Question, :count)
        end
  
        it 're-renders the `new` template' do
          post :create, @question_params
          expect(response).to render_template('new')
        end
      end
    end
  
    describe '#update' do
      before do
        @question = FactoryGirl.create(:question, :questioner => current_user)
      end
  
      context 'with valid params' do
        before do
          @new_title = 'another question title'
          patch :update, :question => {:title => @new_title}, :id => @question.id
        end
  
        it 'updates the question' do
          expect(@question.reload.title).to eq(@new_title)
        end
  
        it 'redirects to the question path' do
          expect(response).to redirect_to([:ask, @question])
        end
      end
  
      context 'with invalid params' do
        before do
          @blank_title = ''
          patch :update, :question => {:title => @blank_title}, :id => @question.id
        end
  
        it 'does not update the question' do
          expect(@question.reload.title).not_to eq(@blank_title)
        end
  
        it 're-render the `new` template' do
          expect(response).to render_template(:new)
        end
      end
    end
  
    describe '#destroy' do
      context 'for questioner' do
        before do
          @question = FactoryGirl.create(:question, :questioner => current_user)
        end
  
        it 'destroys the question' do
          expect{
            delete :destroy, :id => @question.id
          }.to change(Question, :count).by(-1)
        end
  
        it 'redirects to questions list' do
          delete :destroy, :id => @question.id
          expect(response).to redirect_to(ask_root_path)
        end
      end
  
      context 'for others' do
        before do
          @question = FactoryGirl.create :question
        end
  
        it 'renders 403' do
          delete :destroy, :id => @question.id
          expect(response.status).to eq(403)
        end
      end
    end
  end
end
