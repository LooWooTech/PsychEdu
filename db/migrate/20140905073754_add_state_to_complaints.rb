class AddStateToComplaints < ActiveRecord::Migration

  class Complaint < ActiveRecord::Base; end

  def up
    add_column :complaints, :state, :integer, :default => 0
    Complaint.where(:state => nil).all.each{|c| c.update_attribute :state, 0 }
  end

  def down
    remove_column :complaints, :state
  end
end
