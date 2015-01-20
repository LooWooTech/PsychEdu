class AddKlassToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :klass, index: true
  end
end
