module AssociatedTree
  extend ActiveSupport::Concern

  module ClassMethods
    def auto_create(associations, params)
      callback_name = "create_#{associations}_for_all_#{params[:for]}"
      after_create callback_name

      define_method callback_name do
        __send__(params[:for]).each do |parent|
          parent.__send__(associations).create self.class.name.underscore => self
        end
      end
    end
  end
end
