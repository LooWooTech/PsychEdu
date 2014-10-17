class ChangeTopicExamScoresDefaultToNil < ActiveRecord::Migration
  class TopicExamScore < ActiveRecord::Base ; end
  def up
    TopicExamScore.where(:score => 0).each{|score| score.update_attribute :score, nil }
    change_column_default :topic_exam_scores, :score, nil
  end

  def down
    TopicExamScore.where(:score => nil).each{|score| score.update_attribute :score, 0 }
    change_column_default :topic_exam_scores, :score, 0
  end
end
