class AddInUnitToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :in_unit, :boolean, :default => false
  end
end
