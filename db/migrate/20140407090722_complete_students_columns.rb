class CompleteStudentsColumns < ActiveRecord::Migration
  def change
    add_column :students, :cipher, :string
    add_column :students, :cipher_answer, :string
    add_column :students, :telephone, :string
    add_column :students, :mobile, :string
    add_column :students, :email, :string
    add_column :students, :qq, :string
    add_column :students, :identification, :string
    add_column :students, :birthday, :date
    add_column :students, :province, :string
    add_column :students, :unit_name, :string
    add_column :students, :address, :string
    add_column :students, :zip_code, :string
    add_column :students, :education, :string
    add_column :students, :special_field, :string
    add_column :students, :level, :string
    add_column :students, :certificate_number, :string
    add_column :students, :certify_date, :date
    add_column :students, :training_experience, :text
    add_column :students, :psychology_job, :text
  end
end
