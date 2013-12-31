class CreateUnitExams < ActiveRecord::Migration
  def change
    create_table :unit_exams do |t|
      t.references :unit_learning, index: true

      t.timestamps
    end
  end
end
