class QuestionPolicy
  def initialize(user, question)
    @user = user
    @question = question
  end

  def update?
    @question.questioner == @user
  end
end
