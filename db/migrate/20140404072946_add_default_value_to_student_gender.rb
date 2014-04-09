class AddDefaultValueToStudentGender < ActiveRecord::Migration
  def up
    change_column_default :students, :gender, 2
  end

  def down
    change_column_default :students, :gender, nil
  end
end
