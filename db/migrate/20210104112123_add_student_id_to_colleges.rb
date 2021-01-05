class AddStudentIdToColleges < ActiveRecord::Migration[6.0]
  def change
    add_column :colleges, :student_id, :int
  end
end