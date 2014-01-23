class UnitExam < ActiveRecord::Base

  FULL_MARKS = 100.0
  PASS_LINE = 60.0
  
  belongs_to :unit_learning
  has_many :singular_choice_answers, :dependent => :destroy
  has_many :multiple_choice_answers, :dependent => :destroy

  delegate :chapter_name, :to => :unit_learning

  accepts_nested_attributes_for :singular_choice_answers, :multiple_choice_answers, :update_only => true

  after_create :generate_empty_answers

  def name
    unit_learning.only_child? ? chapter_name : unit_learning.name
  end

  def end_at
    created_at + unit_learning.unit.exam_minutes.minutes
  end

  def over?
    submitted? || rest_seconds <= 0
  end

  def passed?
    score >= PASS_LINE
  end

  def rest_seconds
    end_at - Time.now
  end

  def score
    return 0 if answers_count == 0
    (FULL_MARKS * correct_answers_count / answers_count).round 1
  end

  def answers_count
    singular_choice_answers.count + multiple_choice_answers.count
  end

  def correct_answers_count
    singular_choice_answers.select(&:correct?).count + multiple_choice_answers.select(&:correct?).count
  end

  private

  def generate_empty_answers
    unit_learning.random_singular_choice_questions{|question| singular_choice_answers.create :question => question }
    unit_learning.random_multiple_choice_questions{|question| multiple_choice_answers.create :question => question }
  end

end
