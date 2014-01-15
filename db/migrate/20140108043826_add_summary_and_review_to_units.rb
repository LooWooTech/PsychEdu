class AddSummaryAndReviewToUnits < ActiveRecord::Migration
  def change
    add_column :units, :summary, :text
    add_column :units, :review, :text
  end
end
