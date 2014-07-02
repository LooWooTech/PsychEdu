class ScoreRule < ActiveRecord::Base
  belongs_to :topic_testing
  has_many :topic_exam_scores, :dependent => :destroy
end
