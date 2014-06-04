module Ask
  module QuestionsHelper
    def top_link
      text = @question.top? ? '取消置顶' : '置顶'
      link_to text, top_ask_question_path(@question), :method => :patch if can?(:manage, @question)
    end
  
    def refine_link
      text = @question.refined? ? '取消精选' : '精选'
      link_to text, refine_ask_question_path(@question), :method => :patch if can?(:manage, @question)
    end
  
    def question_link(question)
      title = question.title
      title = "[顶]#{title}" if question.top?
      title = "[精]#{title}" if question.refined?
      link_to title, [:ask, question]
    end
  end
end
