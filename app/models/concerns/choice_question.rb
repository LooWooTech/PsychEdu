module ChoiceQuestion
  extend ActiveSupport::Concern

  included do
    belongs_to :unit
    belongs_to :case, :class_name => 'CaseQuestion'
    has_many :choices, :as => :choice_question, :dependent => :destroy
  end
end
