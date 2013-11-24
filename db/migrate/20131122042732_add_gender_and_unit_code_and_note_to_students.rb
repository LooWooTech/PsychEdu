class AddGenderAndUnitCodeAndNoteToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gender, :integer
    add_column :students, :unit_code, :string
    add_column :students, :note, :string
    add_reference :students, :added_by, index: true
  end
end
