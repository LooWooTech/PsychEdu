class CreateSettings < ActiveRecord::Migration
  class Setting < ActiveRecord::Base; end
  def up
    create_table :settings do |t|
      t.string :forum_banner
      t.timestamps
    end
    Setting.create if Setting.count == 0
  end

  def down
    drop_table :settings
  end
end
