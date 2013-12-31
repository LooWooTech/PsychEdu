class UnitExam < ActiveRecord::Base
  belongs_to :unit_learning
  has_many :exam_answers, :dependent => :destroy
end
