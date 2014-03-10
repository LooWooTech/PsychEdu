module ChoiceQuestion
  extend ActiveSupport::Concern

  included do
    belongs_to :unit
    belongs_to :case, :class_name => 'CaseQuestion'
    has_many :choices, :as => :choice_question, :dependent => :destroy

    validates :content, :uniqueness => {:scope => :unit_id}

    accepts_nested_attributes_for :choices, :update_only => true
  end

  def published?
    answers.any?
  end
end
