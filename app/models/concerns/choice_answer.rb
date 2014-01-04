module ChoiceAnswer
  extend ActiveSupport::Concern

  included do
    belongs_to :case_answer
    belongs_to :unit_exam

    delegate :content, :to => :question, :prefix => true
  end

  def wrong?
    !correct?
  end
end
