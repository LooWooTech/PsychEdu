module QuestionsHelper
  def top_link
    text = @question.top? ? '取消置顶' : '置顶'
    link_to text, top_question_path(@question), :method => :patch if can?(:manage, @question)
  end

  def question_link(question)
    title = question.top? ? "[顶]#{question.title}" : question.title
    link_to title, question
  end
end
