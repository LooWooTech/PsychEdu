class MergePeriodsIntoOneTable < ActiveRecord::Migration

  module Merged
    class PeriodApplication < ActiveRecord::Base
      self.table_name = :period_applications
      belongs_to :topic_learning
      belongs_to :reviewer, :class_name => 'Administrator'
      self.inheritance_column = :_type_disabled
    end
  end

  module Separated
    class LearningPeriod < ActiveRecord::Base
      self.table_name = :learning_periods
      belongs_to :topic_learning
      belongs_to :reviewer, :class_name => 'Administrator'
    end
  end

  def up
    create_table :period_applications do |t|
      t.references :topic_learning
      t.references :parent
      t.string :type
      t.date :start_on
      t.date :end_on
      t.integer :review_state, :default => 0
      t.references :reviewer
      t.timestamps
    end

    Separated::LearningPeriod.find_each do |p|
      Merged::PeriodApplication.create :topic_learning => p.topic_learning,
        :type => 'LearningPeriod',
        :start_on => p.start_on,
        :end_on => p.end_on,
        :review_state => p.review_state,
        :reviewer => p.reviewer,
        :created_at => p.created_at,
        :updated_at => p.updated_at
    end

    drop_table :learning_periods
    drop_table :leaving_periods
    drop_table :resumings
  end

  def down
    create_table :learning_periods do |t|
      t.references :topic_learning
      t.date :start_on
      t.date :end_on
      t.integer :review_state, :default => 0
      t.references :reviewer
      t.timestamps
    end

    create_table :leaving_periods do |t|
      t.references :learning_period
      t.date :start_on
      t.date :end_on
      t.integer :review_state, :default => 0
      t.references :reviewer
      t.timestamps
    end

    create_table :resumings do |t|
      t.references :leaving_period
      t.date :date
      t.integer :review_state, :default => 0
      t.references :reviewer
      t.timestamps
    end

    Merged::LearningPeriod.find_each do |p|
      Separated::LearningPeriod.create :topic_learning => p.topic_learning,
        :start_on => p.start_on,
        :end_on => p.end_on,
        :review_state => p.review_state,
        :reviewer => p.reviewer,
        :created_at => p.created_at,
        :updated_at => p.updated_at
    end

    drop_table :period_applications
  end
end
