class AddSubmittedToUnitExams < ActiveRecord::Migration
  def change
    add_column :unit_exams, :submitted, :boolean, :default => false
  end
end
