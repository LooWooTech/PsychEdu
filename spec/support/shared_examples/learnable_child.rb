shared_examples 'learnable child' do |parent_name, params|
  before do
    @parent = FactoryGirl.create parent_name
    @parent_learnings = @parent.__send__ params[:through]
    @parent_learnings << FactoryGirl.create(params[:through].to_s.singularize)

    @model_name = described_class.name.underscore
    @model = FactoryGirl.create @model_name, parent_name => @parent
  end

  it "auto create #{params[:as]} for all #{params[:through]} in #{parent_name}" do
    @parent_learnings.each do |parent_learning|
      expect(parent_learning.__send__(params[:as]).find_by(@model_name => @model)).not_to be_nil
    end
  end
end
