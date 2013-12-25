shared_examples 'auto create child learning objects' do |child_learning, params|
  parent_name = params[:parent]
  child_name = params[:for]
  children_names = child_name.to_s.pluralize
  parent_learning_name = described_class.name.underscore

  context "#{parent_name} has many #{children_names}" do
    before do
      @children_count = 5
      @parent = FactoryGirl.create parent_name
      FactoryGirl.create_list child_name, @children_count, parent_name => @parent
      @parent_learning = FactoryGirl.create parent_learning_name, parent_name => @parent
    end

    it "auto creates #{child_learning} for each #{child_name}" do
      expect(@parent_learning.__send__(child_learning).count).to eq(@children_count) 
      @parent.__send__(children_names).each do |child|
        expect(@parent_learning.__send__(child_learning).find_by child_name => child).not_to be_nil
      end
    end
  end
end
