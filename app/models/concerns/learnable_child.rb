module LearnableChild
  extend ActiveSupport::Concern

  module ClassMethods
    def learnable_child_for(parent_name, params)
      after_create :create_learning_object
      belongs_to parent_name

      define_method :create_learning_object do
        __send__(parent_name).__send__(params[:through]).each do |association|
          association.__send__(params[:as]).create self.class.name.underscore => self
        end
      end
    end
  end
end
