class CreateScoreRules < ActiveRecord::Migration
  class ScoreRule < ActiveRecord::Base; end

  class TopicTesting < ActiveRecord::Base
    has_many :score_rules
    belongs_to :topic
    has_many :topic_exams, :through => :topic

  end

  class Topic < ActiveRecord::Base
    has_many :topic_learnings
    has_many :topic_exams, :through => :topic_learnings
    has_one :topic_testing
  end

  class TopicLearning < ActiveRecord::Base
    belongs_to :topic
    has_many :topic_exams
  end

  class TopicExam < ActiveRecord::Base
    belongs_to :topic_learning
    has_many :topic_exam_scores
  end

  class TopicExamScore < ActiveRecord::Base
    belongs_to :score_rule
    belongs_to :topic_exam
  end

  def up
    create_table :score_rules do |t|
      t.references :topic_testing, index: true
      t.string :name
      t.float :score, :default => 0.0
      t.text :description

      t.timestamps
    end

    create_table :topic_exam_scores do |t|
      t.references :topic_exam, index: true
      t.references :score_rule, index: true
      t.float :score, :default => 0.0
      t.text :comment

      t.timestamps
    end

    TopicTesting.find_each do |t|
      score_rule = t.score_rules.create :name => '评分规则',
                                        :description => t.grading_rules,
                                        :score => 100

      t.topic_exams.each do |exam|
        exam.topic_exam_scores.create :score => exam.score,
                                      :comment => exam.review,
                                      :score_rule => score_rule
      end
    end

    remove_column :topic_testings, :grading_rules
    remove_column :topic_exams, :score
    remove_column :topic_exams, :review
  end

  def down
    add_column :topic_testings, :grading_rules, :text
    add_column :topic_exams, :score, :float, :default => 0.0
    add_column :topic_exams, :review, :text

    TopicTesting.find_each do |t|
      t.update_attribute :grading_rules, t.score_rules.first.try(:grading_rules)
    end

    TopicExam.find_each do |e|
      e.update_attributes :score => e.topic_exam_scores.first.try(:score),
        :review => e.topic_exam_scores.first.try(:comment)
    end

    drop_table :score_rules
    drop_table :topic_exam_scores
  end
end
