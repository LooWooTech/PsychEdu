class CaseQuestion < ActiveRecord::Base
  has_many :singular_choice_questions, :dependent => :destroy
  has_many :multiple_choice_questions, :dependent => :destroy
end
