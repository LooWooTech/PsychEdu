class TopicMaterialVideo < ActiveRecord::Base
  belongs_to :case_analysis

  validates :name, :presence => true
end
