shared_examples 'learnable child' do |parent_name, params|
  before do
    @subject_name = described_class.name.underscore
    @parent = FactoryGirl.create parent_name
    @parent_learnings = @parent.__send__ params[:through]
    @parent_learnings << FactoryGirl.create(params[:through].to_s.singularize)
    subject.update_attribute parent_name, @parent
  end

  it "auto create #{params[:as]} for all #{params[:through]} in #{parent_name}" do
    @parent_learnings.each do |parent_learning|
      expect(parent_learning.__send__(params[:as]).find_by(@subject_name => subject)).not_to be_nil
    end
  end

  it "auto destroy #{params[:as]} for all #{params[:through]} in #{parent_name} after disconnect from #{parent_name}" do
    subject.update_attribute parent_name, nil
    @parent_learnings.each do |parent_learning|
      expect(parent_learning.__send__(params[:as]).find_by(@subject_name => subject)).to be_nil
    end
    
  end
end
