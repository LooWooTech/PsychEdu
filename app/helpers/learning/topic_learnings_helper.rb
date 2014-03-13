module Learning
  module TopicLearningsHelper
    def topic_learning_state(topic_learning)
      if topic_learning.out_of_period?
        '超期'
      elsif topic_learning.ongoing?
        '在学'
      else
        '休学'
      end
    end

  end
end
