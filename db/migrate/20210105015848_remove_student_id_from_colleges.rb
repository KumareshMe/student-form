class RemoveStudentIdFromColleges < ActiveRecord::Migration[6.0]
  def change
    remove_column :colleges, :student_id, :integer
  end
end
