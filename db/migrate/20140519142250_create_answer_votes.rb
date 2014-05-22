class CreateAnswerVotes < ActiveRecord::Migration
  def change
    create_table :answer_votes do |t|
      t.references :voter, index: true, polymorphic: true
      t.references :answer, index: true
      t.boolean :up

      t.timestamps
    end
  end
end
