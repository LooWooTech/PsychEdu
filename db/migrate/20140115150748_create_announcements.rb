class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.references :topic, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
