class CreateChoicesMultiple < ActiveRecord::Migration
  def change
    create_table :choices_multiple do |t|
      t.references :choice
      t.references :multiple_choice_answer
    end
  end
end
