module LearnableChild
  extend ActiveSupport::Concern

  module ClassMethods
    def learnable_child_for(parent_name, params)
      after_save :maintain_learning_association
      belongs_to parent_name

      define_method :maintain_learning_association do
        if parent = __send__(parent_name)
          parent.__send__(params[:through]).each do |association|
            association.__send__(params[:as]).create self.class.name.underscore => self
          end
        else
          __send__(params[:as]).reload.destroy_all
        end
      end
    end
  end
end
