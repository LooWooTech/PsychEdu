class AddPublisherToAnnouncements < ActiveRecord::Migration
  def up
    add_reference :announcements, :publisher, index: true
    if admin = Account.where(:username => 'admin').first.try(:owner)
      Announcement.find_each do |announcement|
        announcement.update_attribute :publisher, admin
      end
    end
  end

  def down
    remove_reference :announcements, :publisher, index: true
  end
end
