class Choice < ActiveRecord::Base
  belongs_to :choice_question, :polymorphic => true
end
