class Question < ActiveRecord::Base
  belongs_to :questioner, :class_name => 'User'

  has_many :answers

  validates :title, :presence => true, :length => {:maximum => 140}
  validates :content, :presence => true

  def no_answer?
    answers.empty?
  end
end
