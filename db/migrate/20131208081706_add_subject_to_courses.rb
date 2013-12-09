class AddSubjectToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :subject, index: true
  end
end
