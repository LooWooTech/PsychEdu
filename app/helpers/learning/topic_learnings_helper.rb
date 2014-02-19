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

    def period(topic_learning)
      "从#{I18n.l topic_learning.current_learning_period.start_on, :format => :long }<br/>到#{I18n.l topic_learning.current_learning_period.actually_end_on, :format => :long}"
    end
  end
end
