module ChoiceQuestion
  extend ActiveSupport::Concern

  included do
    belongs_to :case_question, :foreign_key => :parent_id
    has_many :choices, :dependent => :destroy, :as => :choice_question
  end
end
