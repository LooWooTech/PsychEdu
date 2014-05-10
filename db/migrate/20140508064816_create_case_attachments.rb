class CreateCaseAttachments < ActiveRecord::Migration
  def change
    create_table :case_attachments do |t|
      t.string :file
      t.references :case_analysis, index: true

      t.timestamps
    end
  end
end
