class DropstudentColleges < ActiveRecord::Migration[6.0]
  def change
    drop_table :student_colleges
  end
end
