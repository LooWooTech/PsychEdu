class Choice < ActiveRecord::Base
  belongs_to :choice_question, :polymorphic => true

  scope :correct, -> { where :correct => true }
end
